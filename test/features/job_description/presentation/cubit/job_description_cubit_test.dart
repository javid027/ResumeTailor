import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resume_tailor/core/error/api_exception.dart';
import 'package:resume_tailor/features/job_description/domain/models/job_description.dart';
import 'package:resume_tailor/features/job_description/domain/repositories/job_description_repository.dart';
import 'package:resume_tailor/features/job_description/presentation/cubit/job_description_cubit.dart';
import 'package:resume_tailor/features/job_description/presentation/cubit/job_description_state.dart';

class _MockJobDescriptionRepository extends Mock implements JobDescriptionRepository {}

void main() {
  late _MockJobDescriptionRepository repository;

  final jobDescription = JobDescription(
    id: 'jd-1',
    userId: 'user-1',
    rawText: 'We need a Dart engineer with Flutter experience.',
    createdAt: DateTime(2026, 9, 16),
    updatedAt: DateTime(2026, 9, 16),
    keywords: const ['Dart', 'Flutter'],
    requirements: const ['3+ years of Flutter experience'],
  );

  setUp(() {
    repository = _MockJobDescriptionRepository();
  });

  group('submit', () {
    blocTest<JobDescriptionCubit, JobDescriptionState>(
      'emits [submitting, success] when extraction succeeds',
      build: () => JobDescriptionCubit(repository),
      setUp: () => when(() => repository.create(rawText: any(named: 'rawText')))
          .thenAnswer((_) async => jobDescription),
      act: (cubit) => cubit.submit(jobDescription.rawText),
      expect: () => [
        const JobDescriptionState.submitting(),
        JobDescriptionState.success(jobDescription: jobDescription),
      ],
    );

    blocTest<JobDescriptionCubit, JobDescriptionState>(
      'emits [submitting, failure] with a mapped message on a validation error',
      build: () => JobDescriptionCubit(repository),
      setUp: () => when(() => repository.create(rawText: any(named: 'rawText'))).thenThrow(
        const ApiException(
          code: 'VALIDATION_ERROR',
          message: 'Request validation failed',
          details: {},
          statusCode: 400,
        ),
      ),
      act: (cubit) => cubit.submit(''),
      expect: () => [
        const JobDescriptionState.submitting(),
        const JobDescriptionState.failure(message: 'Please check your details and try again.'),
      ],
    );
  });

  group('reset', () {
    blocTest<JobDescriptionCubit, JobDescriptionState>(
      'returns to initial from a success state',
      build: () => JobDescriptionCubit(repository),
      setUp: () => when(() => repository.create(rawText: any(named: 'rawText')))
          .thenAnswer((_) async => jobDescription),
      act: (cubit) async {
        await cubit.submit(jobDescription.rawText);
        cubit.reset();
      },
      skip: 2,
      expect: () => [const JobDescriptionState.initial()],
    );
  });
}
