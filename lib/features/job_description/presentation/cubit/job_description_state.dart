import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/job_description.dart';

part 'job_description_state.freezed.dart';

@freezed
sealed class JobDescriptionState with _$JobDescriptionState {
  const factory JobDescriptionState.initial() = JobDescriptionInitial;

  const factory JobDescriptionState.submitting() = JobDescriptionSubmitting;

  const factory JobDescriptionState.success({required JobDescription jobDescription}) =
      JobDescriptionSuccess;

  const factory JobDescriptionState.failure({required String message}) = JobDescriptionFailure;
}
