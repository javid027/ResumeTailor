import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/history_item.dart';

part 'history_state.freezed.dart';

@freezed
sealed class HistoryState with _$HistoryState {
  const factory HistoryState.initial() = HistoryInitial;

  const factory HistoryState.loading() = HistoryLoading;

  const factory HistoryState.loaded({required List<HistoryItem> items, required int total}) =
      HistoryLoaded;

  const factory HistoryState.loadingMore({required List<HistoryItem> items, required int total}) =
      HistoryLoadingMore;

  const factory HistoryState.loadMoreFailure({
    required List<HistoryItem> items,
    required int total,
    required String message,
  }) = HistoryLoadMoreFailure;

  const factory HistoryState.failure({required String message}) = HistoryFailure;
}
