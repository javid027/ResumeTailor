import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/error/error_message_mapper.dart';
import '../../domain/models/history_item.dart';
import '../../domain/repositories/history_repository.dart';
import 'history_state.dart';

@injectable
class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this._repository) : super(const HistoryState.initial()) {
    load();
  }

  final HistoryRepository _repository;

  static const _pageSize = 20;
  int _page = 1;

  Future<void> load() async {
    emit(const HistoryState.loading());
    _page = 1;
    try {
      final page = await _repository.getHistory(page: _page, limit: _pageSize);
      emit(HistoryState.loaded(items: page.items, total: page.total));
    } on ApiException catch (e) {
      emit(HistoryState.failure(message: userMessageFor(e)));
    }
  }

  Future<void> loadMore() async {
    final (items, total) = switch (state) {
      HistoryLoaded(:final items, :final total) => (items, total),
      HistoryLoadMoreFailure(:final items, :final total) => (items, total),
      _ => (null, null),
    };
    if (items == null || total == null) return;
    if (items.length >= total) return;

    emit(HistoryState.loadingMore(items: items, total: total));
    final nextPage = _page + 1;
    try {
      final page = await _repository.getHistory(page: nextPage, limit: _pageSize);
      _page = nextPage;
      emit(HistoryState.loaded(items: <HistoryItem>[...items, ...page.items], total: page.total));
    } on ApiException catch (e) {
      emit(HistoryState.loadMoreFailure(items: items, total: total, message: userMessageFor(e)));
    }
  }
}
