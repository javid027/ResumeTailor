import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/error/error_message_mapper.dart';
import '../../domain/models/bullet_diff.dart';
import '../../domain/models/tailoring_result.dart';
import '../../domain/repositories/tailoring_repository.dart';
import 'tailoring_event.dart';
import 'tailoring_state.dart';

@injectable
class TailoringBloc extends Bloc<TailoringEvent, TailoringState> {
  TailoringBloc(this._repository) : super(const TailoringState.initial()) {
    on<TailoringEvent>((event, emit) => switch (event) {
          TailoringStarted(:final resumeId, :final jobDescriptionId) =>
            _onStarted(resumeId, jobDescriptionId, emit),
          TailoringLoadRequested(:final tailoringId) => _onLoadRequested(tailoringId, emit),
          TailoringCancelRequested() => _onCancelRequested(),
          TailoringBulletToggled(:final bulletId) => _onBulletToggled(bulletId, emit),
          TailoringAcceptRequested() => _onAcceptRequested(emit),
        });
  }

  final TailoringRepository _repository;
  CancelToken? _cancelToken;

  Future<void> _onStarted(
    String resumeId,
    String jobDescriptionId,
    Emitter<TailoringState> emit,
  ) async {
    emit(const TailoringState.inProgress());
    final cancelToken = CancelToken();
    _cancelToken = cancelToken;
    try {
      final result = await _repository.create(
        resumeId: resumeId,
        jobDescriptionId: jobDescriptionId,
        consent: true,
        cancelToken: cancelToken,
      );
      emit(TailoringState.loaded(
        result: result,
        selectedBulletIds: _modifiedBulletIds(result),
      ));
    } on ApiException catch (e) {
      if (e.code == 'REQUEST_CANCELLED') {
        emit(const TailoringState.initial());
      } else {
        emit(TailoringState.failure(message: userMessageFor(e)));
      }
    } finally {
      _cancelToken = null;
    }
  }

  Future<void> _onLoadRequested(String tailoringId, Emitter<TailoringState> emit) async {
    emit(const TailoringState.inProgress());
    try {
      final result = await _repository.get(tailoringId);
      // A job already accepted shows what was actually applied; otherwise
      // default to reviewing every suggested (modified) change.
      final selected = result.acceptedAt != null
          ? Set<String>.of(result.acceptedBulletIds)
          : _modifiedBulletIds(result);
      emit(TailoringState.loaded(result: result, selectedBulletIds: selected));
    } on ApiException catch (e) {
      emit(TailoringState.failure(message: userMessageFor(e)));
    }
  }

  void _onCancelRequested() => _cancelToken?.cancel();

  void _onBulletToggled(String bulletId, Emitter<TailoringState> emit) {
    final current = state;
    final (result, selected) = switch (current) {
      TailoringLoaded(:final result, :final selectedBulletIds) => (result, selectedBulletIds),
      TailoringAcceptFailure(:final result, :final selectedBulletIds) => (result, selectedBulletIds),
      _ => (null, null),
    };
    if (result == null || selected == null) return;

    final updated = Set<String>.of(selected);
    if (!updated.remove(bulletId)) updated.add(bulletId);
    emit(TailoringState.loaded(result: result, selectedBulletIds: updated));
  }

  Future<void> _onAcceptRequested(Emitter<TailoringState> emit) async {
    final current = state;
    final (result, selected) = switch (current) {
      TailoringLoaded(:final result, :final selectedBulletIds) => (result, selectedBulletIds),
      TailoringAcceptFailure(:final result, :final selectedBulletIds) => (result, selectedBulletIds),
      _ => (null, null),
    };
    if (result == null || selected == null) return;

    emit(TailoringState.accepting(result: result, selectedBulletIds: selected));
    try {
      final updated = await _repository.accept(result.id, acceptedBulletIds: selected.toList());
      emit(TailoringState.loaded(
        result: updated,
        selectedBulletIds: Set.of(updated.acceptedBulletIds),
      ));
    } on ApiException catch (e) {
      emit(TailoringState.acceptFailure(
        result: result,
        selectedBulletIds: selected,
        message: userMessageFor(e),
      ));
    }
  }

  static Set<String> _modifiedBulletIds(TailoringResult result) => result.perBulletDiffs
      .where((diff) => diff.status == BulletDiffStatus.modified)
      .map((diff) => diff.bulletId)
      .toSet();
}
