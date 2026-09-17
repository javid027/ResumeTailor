import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/di/injection.dart';
import '../../domain/models/resume.dart';
import '../cubit/resume_cubit.dart';
import '../cubit/resume_state.dart';
import '../widgets/resume_editor_form.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ResumeCubit>(),
      child: const _UploadView(),
    );
  }
}

class _UploadView extends StatelessWidget {
  const _UploadView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resume')),
      body: BlocConsumer<ResumeCubit, ResumeState>(
        listenWhen: (previous, current) => current is ResumeSaveFailure,
        listener: (context, state) {
          final failure = state as ResumeSaveFailure;
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(failure.message)));
        },
        builder: (context, state) {
          return switch (state) {
            ResumeInitial() || ResumeUploadFailure() => _UploadPrompt(
                errorMessage: state is ResumeUploadFailure ? state.message : null,
              ),
            ResumeUploading() => const _UploadPrompt(isUploading: true),
            ResumeLoaded(:final resume) => _Editor(resume: resume, isSaving: false),
            ResumeSaving(:final resume) => _Editor(resume: resume, isSaving: true),
            ResumeSaveFailure(:final resume) => _Editor(resume: resume, isSaving: false),
          };
        },
      ),
    );
  }
}

class _Editor extends StatelessWidget {
  const _Editor({required this.resume, required this.isSaving});

  final Resume resume;
  final bool isSaving;

  @override
  Widget build(BuildContext context) {
    return ResumeEditorForm(
      resume: resume,
      isSaving: isSaving,
      onSave: (draft) => context.read<ResumeCubit>().saveChanges(draft),
      onStartOver: () => context.read<ResumeCubit>().startOver(),
      onAddJobDescription: () => context.push(AppRoute.jobDescription.path, extra: resume.id),
    );
  }
}

class _UploadPrompt extends StatelessWidget {
  const _UploadPrompt({this.errorMessage, this.isUploading = false});

  final String? errorMessage;
  final bool isUploading;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.description_outlined, size: 56),
            const SizedBox(height: 16),
            const Text('Upload your resume to get started.'),
            const SizedBox(height: 4),
            const Text('PDF or DOCX, up to 5MB.', style: TextStyle(color: Colors.grey)),
            if (errorMessage != null) ...[
              const SizedBox(height: 16),
              Text(errorMessage!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
            ],
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: isUploading ? null : () => context.read<ResumeCubit>().pickAndUpload(),
              icon: isUploading
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.upload_file),
              label: Text(isUploading ? 'Uploading...' : 'Choose file'),
            ),
          ],
        ),
      ),
    );
  }
}
