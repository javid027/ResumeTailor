import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resume_tailor/core/error/api_exception.dart';
import 'package:resume_tailor/features/history/domain/models/history_item.dart';
import 'package:resume_tailor/features/history/domain/models/history_page.dart';
import 'package:resume_tailor/features/history/domain/repositories/history_repository.dart';
import 'package:resume_tailor/features/history/presentation/cubit/history_cubit.dart';
import 'package:resume_tailor/features/history/presentation/cubit/history_state.dart';
import 'package:resume_tailor/features/tailoring/domain/models/tailoring_result.dart';

class _MockHistoryRepository extends Mock implements HistoryRepository {}

void main() {
  late _MockHistoryRepository repository;

  HistoryItem buildItem(String id) => HistoryItem(
        id: id,
        status: TailoringStatus.completed,
        atsScoreBefore: 60,
        atsScoreAfter: 80,
        unmatchedRequirements: const [],
        createdAt: DateTime(2026, 9, 16),
        resume: const HistoryItemResume(id: 'resume-1'),
        jobDescription: const HistoryItemJobDescription(id: 'jd-1', excerpt: 'Backend role'),
      );

  setUp(() {
    repository = _MockHistoryRepository();
  });

  // HistoryCubit fires load() from its own constructor, and its first emit
  // (`loading`) happens synchronously before bloc_test's listener attaches —
  // a harmless artifact of testing a self-initializing Cubit, not a real
  // gap (widgets read `cubit.state` directly, not just the stream). Only
  // the post-await emit is observable here.
  HistoryCubit buildCubit() => HistoryCubit(repository);

  group('initial load', () {
    blocTest<HistoryCubit, HistoryState>(
      'emits loaded with the first page',
      setUp: () => when(() => repository.getHistory(page: 1, limit: 20)).thenAnswer(
        (_) async => HistoryPage(items: [buildItem('job-1')], page: 1, limit: 20, total: 1),
      ),
      build: buildCubit,
      expect: () => [
        isA<HistoryLoaded>()
            .having((s) => s.items.map((i) => i.id), 'ids', ['job-1'])
            .having((s) => s.total, 'total', 1),
      ],
    );

    blocTest<HistoryCubit, HistoryState>(
      'emits a mapped failure message on error',
      // thenAnswer (not thenThrow) so the rejection is genuinely
      // asynchronous, like a real failed HTTP call — thenThrow rejects
      // synchronously, which would also get swallowed by the same
      // before-the-listener-attaches timing as the `loading` emit above.
      setUp: () => when(() => repository.getHistory(page: 1, limit: 20)).thenAnswer(
        (_) async => throw const ApiException(
          code: 'AUTH_UNAUTHORIZED',
          message: 'x',
          details: {},
          statusCode: 401,
        ),
      ),
      build: buildCubit,
      expect: () => [const HistoryState.failure(message: 'Please log in to continue.')],
    );
  });

  group('loadMore', () {
    // The constructor's own load() is still in flight when `act` starts, so
    // every loadMore test waits for it to resolve first — otherwise
    // loadMore() would see the still-`loading` state and no-op.
    Future<void> awaitInitialLoad(HistoryCubit cubit) =>
        cubit.stream.firstWhere((s) => s is HistoryLoaded || s is HistoryFailure);

    blocTest<HistoryCubit, HistoryState>(
      'appends the next page and keeps the existing items',
      setUp: () {
        when(() => repository.getHistory(page: 1, limit: 20)).thenAnswer(
          (_) async => HistoryPage(items: [buildItem('job-1')], page: 1, limit: 20, total: 2),
        );
        when(() => repository.getHistory(page: 2, limit: 20)).thenAnswer(
          (_) async => HistoryPage(items: [buildItem('job-2')], page: 2, limit: 20, total: 2),
        );
      },
      build: buildCubit,
      act: (cubit) async {
        await awaitInitialLoad(cubit);
        await cubit.loadMore();
      },
      skip: 1,
      expect: () => [
        isA<HistoryLoadingMore>().having((s) => s.items.length, 'items.length', 1),
        isA<HistoryLoaded>().having((s) => s.items.map((i) => i.id), 'ids', ['job-1', 'job-2']),
      ],
      verify: (_) => verify(() => repository.getHistory(page: 2, limit: 20)).called(1),
    );

    blocTest<HistoryCubit, HistoryState>(
      'is a no-op once every item has been loaded',
      setUp: () => when(() => repository.getHistory(page: 1, limit: 20)).thenAnswer(
        (_) async => HistoryPage(items: [buildItem('job-1')], page: 1, limit: 20, total: 1),
      ),
      build: buildCubit,
      act: (cubit) async {
        await awaitInitialLoad(cubit);
        await cubit.loadMore();
      },
      skip: 1,
      expect: () => <HistoryState>[],
      verify: (_) => verifyNever(() => repository.getHistory(page: 2, limit: any(named: 'limit'))),
    );

    blocTest<HistoryCubit, HistoryState>(
      'emits loadMoreFailure and keeps the already-loaded items on error',
      setUp: () {
        when(() => repository.getHistory(page: 1, limit: 20)).thenAnswer(
          (_) async => HistoryPage(items: [buildItem('job-1')], page: 1, limit: 20, total: 2),
        );
        when(() => repository.getHistory(page: 2, limit: 20)).thenAnswer(
          (_) async => throw const ApiException(
            code: 'VALIDATION_ERROR',
            message: 'bad page',
            details: {},
            statusCode: 400,
          ),
        );
      },
      build: buildCubit,
      act: (cubit) async {
        await awaitInitialLoad(cubit);
        await cubit.loadMore();
      },
      skip: 1,
      expect: () => [
        isA<HistoryLoadingMore>(),
        isA<HistoryLoadMoreFailure>()
            .having((s) => s.items.map((i) => i.id), 'ids', ['job-1'])
            .having((s) => s.message, 'message', 'Please check your details and try again.'),
      ],
    );
  });
}
