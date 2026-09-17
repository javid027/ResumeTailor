import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/resume.dart';

part 'resume_state.freezed.dart';

@freezed
sealed class ResumeState with _$ResumeState {
  const factory ResumeState.initial() = ResumeInitial;

  const factory ResumeState.uploading() = ResumeUploading;

  const factory ResumeState.uploadFailure({required String message}) = ResumeUploadFailure;

  const factory ResumeState.loaded({required Resume resume}) = ResumeLoaded;

  /// Carries the resume being edited so the form stays on screen while the
  /// patch request is in flight.
  const factory ResumeState.saving({required Resume resume}) = ResumeSaving;

  const factory ResumeState.saveFailure({required Resume resume, required String message}) =
      ResumeSaveFailure;
}
