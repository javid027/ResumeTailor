import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/error/error_message_mapper.dart';
import '../../data/datasources/resume_file_picker.dart';
import '../../domain/models/resume.dart';
import '../../domain/repositories/resume_repository.dart';
import 'resume_state.dart';

@injectable
class ResumeCubit extends Cubit<ResumeState> {
  ResumeCubit(this._repository, this._filePicker) : super(const ResumeState.initial());

  final ResumeRepository _repository;
  final ResumeFilePicker _filePicker;

  Future<void> pickAndUpload() async {
    final file = await _filePicker.pickResumeFile();
    if (file == null) return;

    emit(const ResumeState.uploading());
    try {
      final resume =
          await _repository.uploadResume(fileBytes: file.bytes, fileName: file.fileName);
      emit(ResumeState.loaded(resume: resume));
    } on ApiException catch (e) {
      emit(ResumeState.uploadFailure(message: userMessageFor(e)));
    }
  }

  /// Sends the full edited [draft] as the patch body — the form always
  /// collects every field, so there's no need to diff against the original.
  Future<void> saveChanges(Resume draft) async {
    emit(ResumeState.saving(resume: draft));
    try {
      final updated = await _repository.patchResume(
        draft.id,
        parsedContact: draft.parsedContact,
        summary: draft.summary,
        experience: draft.experience,
        education: draft.education,
        skills: draft.skills,
      );
      emit(ResumeState.loaded(resume: updated));
    } on ApiException catch (e) {
      emit(ResumeState.saveFailure(resume: draft, message: userMessageFor(e)));
    }
  }

  void startOver() => emit(const ResumeState.initial());
}
