import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/app_routes.dart';
import '../../../../core/di/injection.dart';
import '../../../tailoring/presentation/view/tailoring_result_page.dart';
import '../cubit/job_description_cubit.dart';
import '../cubit/job_description_state.dart';
import '../widgets/extracted_result_view.dart';

const _maxRawTextLength = 20000;

class JobDescriptionPage extends StatelessWidget {
  const JobDescriptionPage({super.key, this.resumeId});

  /// Passed when reached from the Upload screen so a completed extraction
  /// can chain straight into tailoring. Null if this page was opened on its
  /// own — in that case "Tailor my resume" simply isn't offered.
  final String? resumeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<JobDescriptionCubit>(),
      child: _JobDescriptionView(resumeId: resumeId),
    );
  }
}

class _JobDescriptionView extends StatefulWidget {
  const _JobDescriptionView({required this.resumeId});

  final String? resumeId;

  @override
  State<_JobDescriptionView> createState() => _JobDescriptionViewState();
}

class _JobDescriptionViewState extends State<_JobDescriptionView> {
  final _rawTextController = TextEditingController();

  @override
  void dispose() {
    _rawTextController.dispose();
    super.dispose();
  }

  void _submit() {
    final rawText = _rawTextController.text.trim();
    if (rawText.isEmpty || rawText.length > _maxRawTextLength) return;
    context.read<JobDescriptionCubit>().submit(rawText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Job Description')),
      body: BlocConsumer<JobDescriptionCubit, JobDescriptionState>(
        listenWhen: (previous, current) => current is JobDescriptionFailure,
        listener: (context, state) {
          final failure = state as JobDescriptionFailure;
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(content: Text(failure.message)));
        },
        builder: (context, state) {
          return switch (state) {
            JobDescriptionSuccess(:final jobDescription) => ExtractedResultView(
                jobDescription: jobDescription,
                onStartOver: () {
                  _rawTextController.clear();
                  context.read<JobDescriptionCubit>().reset();
                },
                onTailor: widget.resumeId == null
                    ? null
                    : () => context.push(
                          AppRoute.tailoring.path,
                          extra: CreateTailoringArgs(
                            resumeId: widget.resumeId!,
                            jobDescriptionId: jobDescription.id,
                          ),
                        ),
              ),
            JobDescriptionInitial() || JobDescriptionFailure() || JobDescriptionSubmitting() =>
              _PasteForm(
                controller: _rawTextController,
                isSubmitting: state is JobDescriptionSubmitting,
                onSubmit: _submit,
              ),
          };
        },
      ),
    );
  }
}

class _PasteForm extends StatelessWidget {
  const _PasteForm({
    required this.controller,
    required this.isSubmitting,
    required this.onSubmit,
  });

  final TextEditingController controller;
  final bool isSubmitting;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text('Paste the job description below to extract its keywords and requirements.'),
          const SizedBox(height: 16),
          Expanded(
            child: TextField(
              controller: controller,
              maxLength: _maxRawTextLength,
              maxLines: null,
              expands: true,
              textAlignVertical: TextAlignVertical.top,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Paste the full job description here...',
              ),
            ),
          ),
          const SizedBox(height: 8),
          FilledButton(
            onPressed: isSubmitting ? null : onSubmit,
            child: isSubmitting
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Text('Extract keywords'),
          ),
        ],
      ),
    );
  }
}
