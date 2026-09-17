import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resume_tailor/core/error/api_exception.dart';
import 'package:resume_tailor/features/resume_upload/domain/models/resume_sections.dart';
import 'package:resume_tailor/features/tailoring/domain/models/bullet_diff.dart';
import 'package:resume_tailor/features/tailoring/domain/models/tailoring_result.dart';
import 'package:resume_tailor/features/tailoring/domain/repositories/tailoring_repository.dart';
import 'package:resume_tailor/features/tailoring/presentation/bloc/tailoring_bloc.dart';
import 'package:resume_tailor/features/tailoring/presentation/bloc/tailoring_event.dart';
import 'package:resume_tailor/features/tailoring/presentation/bloc/tailoring_state.dart';

class _MockTailoringRepository extends Mock implements TailoringRepository {}

void main() {
  late _MockTailoringRepository repository;

  setUpAll(() {
    registerFallbackValue(CancelToken());
  });

  setUp(() {
    repository = _MockTailoringRepository();
  });

  TailoringResult buildResult({
    required TailoringStatus status,
    List<BulletDiff> perBulletDiffs = const [],
    ResumeSections? finalSections,
    List<String> acceptedBulletIds = const [],
    DateTime? acceptedAt,
  }) {
    return TailoringResult(
      id: 'tailoring-1',
      resumeId: 'resume-1',
      jobDescriptionId: 'jd-1',
      originalSections: const ResumeSections(),
      perBulletDiffs: perBulletDiffs,
      atsScoreBefore: 50,
      atsScoreAfter: status == TailoringStatus.completed ? 78 : null,
      unmatchedRequirements: const [],
      status: status,
      failureReason: status == TailoringStatus.failed ? 'The LLM call timed out.' : null,
      consentGivenAt: DateTime(2026, 9, 16),
      finalSections: finalSections,
      acceptedBulletIds: acceptedBulletIds,
      acceptedAt: acceptedAt,
      createdAt: DateTime(2026, 9, 16),
      updatedAt: DateTime(2026, 9, 16),
    );
  }

  const diffs = [
    BulletDiff(
      sectionId: 'summary',
      bulletId: 'summary',
      original: 'Engineer.',
      suggested: 'Engineer with Flutter expertise.',
      status: BulletDiffStatus.modified,
    ),
    BulletDiff(
      sectionId: 'experience-0',
      bulletId: 'experience-0-bullet-0',
      original: 'Shipped features.',
      suggested: 'Shipped features used by 10 clients.',
      status: BulletDiffStatus.flaggedInvented,
    ),
  ];

  group('TailoringEvent.started', () {
    blocTest<TailoringBloc, TailoringState>(
      'emits [inProgress, loaded] with modified bullets pre-selected on success',
      build: () => TailoringBloc(repository),
      setUp: () => when(() => repository.create(
            resumeId: any(named: 'resumeId'),
            jobDescriptionId: any(named: 'jobDescriptionId'),
            consent: any(named: 'consent'),
            cancelToken: any(named: 'cancelToken'),
          )).thenAnswer(
        (_) async => buildResult(status: TailoringStatus.completed, perBulletDiffs: diffs),
      ),
      act: (bloc) => bloc.add(
        const TailoringEvent.started(resumeId: 'resume-1', jobDescriptionId: 'jd-1'),
      ),
      expect: () => [
        const TailoringState.inProgress(),
        isA<TailoringLoaded>()
            .having((s) => s.selectedBulletIds, 'selectedBulletIds', {'summary'})
            .having((s) => s.result.status, 'status', TailoringStatus.completed),
      ],
    );

    blocTest<TailoringBloc, TailoringState>(
      'emits [inProgress, loaded] with a server-recorded failed status — not a bloc failure',
      build: () => TailoringBloc(repository),
      setUp: () => when(() => repository.create(
            resumeId: any(named: 'resumeId'),
            jobDescriptionId: any(named: 'jobDescriptionId'),
            consent: any(named: 'consent'),
            cancelToken: any(named: 'cancelToken'),
          )).thenAnswer((_) async => buildResult(status: TailoringStatus.failed)),
      act: (bloc) => bloc.add(
        const TailoringEvent.started(resumeId: 'resume-1', jobDescriptionId: 'jd-1'),
      ),
      expect: () => [
        const TailoringState.inProgress(),
        isA<TailoringLoaded>().having((s) => s.result.status, 'status', TailoringStatus.failed),
      ],
    );

    blocTest<TailoringBloc, TailoringState>(
      'emits [inProgress, failure] with a mapped message when the daily quota is exceeded',
      build: () => TailoringBloc(repository),
      setUp: () => when(() => repository.create(
            resumeId: any(named: 'resumeId'),
            jobDescriptionId: any(named: 'jobDescriptionId'),
            consent: any(named: 'consent'),
            cancelToken: any(named: 'cancelToken'),
          )).thenThrow(const ApiException(
        code: 'LLM_DAILY_QUOTA_EXCEEDED',
        message: 'Daily quota exceeded',
        details: {},
        statusCode: 429,
      )),
      act: (bloc) => bloc.add(
        const TailoringEvent.started(resumeId: 'resume-1', jobDescriptionId: 'jd-1'),
      ),
      expect: () => [
        const TailoringState.inProgress(),
        const TailoringState.failure(
          message: "You've reached today's tailoring limit. Please try again tomorrow.",
        ),
      ],
    );

    blocTest<TailoringBloc, TailoringState>(
      'cancelRequested aborts an in-flight request back to initial, not failure',
      build: () => TailoringBloc(repository),
      setUp: () => when(() => repository.create(
            resumeId: any(named: 'resumeId'),
            jobDescriptionId: any(named: 'jobDescriptionId'),
            consent: any(named: 'consent'),
            cancelToken: any(named: 'cancelToken'),
          )).thenAnswer((invocation) async {
        // The mock stands in for TailoringRepositoryImpl, which always
        // converts DioException -> ApiException before it reaches the bloc
        // (see ApiException.fromDioException's DioExceptionType.cancel case).
        final token = invocation.namedArguments[#cancelToken] as CancelToken?;
        await Future<void>.delayed(const Duration(milliseconds: 10));
        if (token?.isCancelled ?? false) {
          throw const ApiException(
            code: 'REQUEST_CANCELLED',
            message: 'The request was cancelled.',
            details: {},
          );
        }
        throw StateError('expected the request to be cancelled');
      }),
      act: (bloc) async {
        bloc.add(const TailoringEvent.started(resumeId: 'resume-1', jobDescriptionId: 'jd-1'));
        await Future<void>.delayed(const Duration(milliseconds: 1));
        bloc.add(const TailoringEvent.cancelRequested());
      },
      wait: const Duration(milliseconds: 50),
      expect: () => [const TailoringState.inProgress(), const TailoringState.initial()],
    );
  });

  group('TailoringEvent.loadRequested', () {
    blocTest<TailoringBloc, TailoringState>(
      'defaults to every modified bullet selected for a not-yet-accepted job',
      build: () => TailoringBloc(repository),
      setUp: () => when(() => repository.get('tailoring-1')).thenAnswer(
        (_) async => buildResult(status: TailoringStatus.completed, perBulletDiffs: diffs),
      ),
      act: (bloc) => bloc.add(const TailoringEvent.loadRequested('tailoring-1')),
      expect: () => [
        const TailoringState.inProgress(),
        isA<TailoringLoaded>().having((s) => s.selectedBulletIds, 'selectedBulletIds', {'summary'}),
      ],
    );

    blocTest<TailoringBloc, TailoringState>(
      'defaults to the server-confirmed selection for an already-accepted job',
      build: () => TailoringBloc(repository),
      setUp: () => when(() => repository.get('tailoring-1')).thenAnswer(
        (_) async => buildResult(
          status: TailoringStatus.completed,
          perBulletDiffs: diffs,
          acceptedBulletIds: const ['summary'],
          acceptedAt: DateTime(2026, 9, 16),
        ),
      ),
      act: (bloc) => bloc.add(const TailoringEvent.loadRequested('tailoring-1')),
      expect: () => [
        const TailoringState.inProgress(),
        isA<TailoringLoaded>().having((s) => s.selectedBulletIds, 'selectedBulletIds', {'summary'}),
      ],
    );

    blocTest<TailoringBloc, TailoringState>(
      'emits a mapped failure message when the job cannot be found',
      build: () => TailoringBloc(repository),
      setUp: () => when(() => repository.get('missing-id')).thenThrow(const ApiException(
        code: 'TAILORING_NOT_FOUND',
        message: 'Not found',
        details: {},
        statusCode: 404,
      )),
      act: (bloc) => bloc.add(const TailoringEvent.loadRequested('missing-id')),
      expect: () => [
        const TailoringState.inProgress(),
        const TailoringState.failure(message: 'That tailoring result could not be found.'),
      ],
    );
  });

  group('TailoringEvent.bulletToggled', () {
    blocTest<TailoringBloc, TailoringState>(
      'adds an unselected bullet and removes a selected one',
      build: () => TailoringBloc(repository),
      seed: () => TailoringState.loaded(
        result: buildResult(status: TailoringStatus.completed, perBulletDiffs: diffs),
        selectedBulletIds: const {},
      ),
      act: (bloc) => bloc.add(const TailoringEvent.bulletToggled('summary')),
      expect: () => [
        isA<TailoringLoaded>().having((s) => s.selectedBulletIds, 'selectedBulletIds', {'summary'}),
      ],
    );
  });

  group('TailoringEvent.acceptRequested', () {
    blocTest<TailoringBloc, TailoringState>(
      'emits [accepting, loaded] with finalSections and the server-confirmed selection',
      build: () => TailoringBloc(repository),
      seed: () => TailoringState.loaded(
        result: buildResult(status: TailoringStatus.completed, perBulletDiffs: diffs),
        selectedBulletIds: const {'summary'},
      ),
      setUp: () => when(() => repository.accept(any(), acceptedBulletIds: any(named: 'acceptedBulletIds')))
          .thenAnswer((_) async => buildResult(
                status: TailoringStatus.completed,
                perBulletDiffs: diffs,
                finalSections: const ResumeSections(summary: 'Engineer with Flutter expertise.'),
                acceptedBulletIds: const ['summary'],
              )),
      act: (bloc) => bloc.add(const TailoringEvent.acceptRequested()),
      expect: () => [
        isA<TailoringAccepting>(),
        isA<TailoringLoaded>()
            .having((s) => s.result.finalSections?.summary, 'finalSections.summary',
                'Engineer with Flutter expertise.')
            .having((s) => s.selectedBulletIds, 'selectedBulletIds', {'summary'}),
      ],
      verify: (_) => verify(() => repository.accept('tailoring-1', acceptedBulletIds: ['summary']))
          .called(1),
    );

    blocTest<TailoringBloc, TailoringState>(
      'emits [accepting, acceptFailure] and keeps the selection on failure',
      build: () => TailoringBloc(repository),
      seed: () => TailoringState.loaded(
        result: buildResult(status: TailoringStatus.completed, perBulletDiffs: diffs),
        selectedBulletIds: const {'summary'},
      ),
      setUp: () => when(() => repository.accept(any(), acceptedBulletIds: any(named: 'acceptedBulletIds')))
          .thenThrow(const ApiException(
        code: 'TAILORING_NOT_FOUND',
        message: 'Not found',
        details: {},
        statusCode: 404,
      )),
      act: (bloc) => bloc.add(const TailoringEvent.acceptRequested()),
      expect: () => [
        isA<TailoringAccepting>(),
        const TypeMatcher<TailoringAcceptFailure>()
            .having((s) => s.selectedBulletIds, 'selectedBulletIds', {'summary'})
            .having((s) => s.message, 'message', 'That tailoring result could not be found.'),
      ],
    );
  });
}
