import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/error/error_message_mapper.dart';
import '../../domain/repositories/job_description_repository.dart';
import 'job_description_state.dart';

@injectable
class JobDescriptionCubit extends Cubit<JobDescriptionState> {
  JobDescriptionCubit(this._repository) : super(const JobDescriptionState.initial());

  final JobDescriptionRepository _repository;

  Future<void> submit(String rawText) async {
    emit(const JobDescriptionState.submitting());
    try {
      final result = await _repository.create(rawText: rawText);
      emit(JobDescriptionState.success(jobDescription: result));
    } on ApiException catch (e) {
      emit(JobDescriptionState.failure(message: userMessageFor(e)));
    }
  }

  void reset() => emit(const JobDescriptionState.initial());
}
