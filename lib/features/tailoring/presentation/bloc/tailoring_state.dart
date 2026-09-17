import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/tailoring_result.dart';

part 'tailoring_state.freezed.dart';

@freezed
sealed class TailoringState with _$TailoringState {
  const factory TailoringState.initial() = TailoringInitial;

  /// The LLM-backed create request is in flight — cancellable.
  const factory TailoringState.inProgress() = TailoringInProgress;

  /// Covers both `result.status == completed` (there's a diff to review)
  /// and `result.status == failed` (the LLM call itself failed server-side —
  /// still a normal response, not an [TailoringState.failure]; see
  /// openapi.yaml's note that a failed job is never an HTTP error).
  const factory TailoringState.loaded({
    required TailoringResult result,
    required Set<String> selectedBulletIds,
  }) = TailoringLoaded;

  const factory TailoringState.accepting({
    required TailoringResult result,
    required Set<String> selectedBulletIds,
  }) = TailoringAccepting;

  const factory TailoringState.acceptFailure({
    required TailoringResult result,
    required Set<String> selectedBulletIds,
    required String message,
  }) = TailoringAcceptFailure;

  /// The create request itself failed (network, quota, validation, etc.) —
  /// distinct from a server-recorded `status: failed` job, which is
  /// [TailoringState.loaded].
  const factory TailoringState.failure({required String message}) = TailoringFailure;
}
