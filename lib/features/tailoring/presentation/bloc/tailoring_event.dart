import 'package:freezed_annotation/freezed_annotation.dart';

part 'tailoring_event.freezed.dart';

@freezed
sealed class TailoringEvent with _$TailoringEvent {
  const factory TailoringEvent.started({
    required String resumeId,
    required String jobDescriptionId,
  }) = TailoringStarted;

  /// Loads an existing tailoring result by id (`GET /tailoring/{id}`) —
  /// used when opening a past job from History, as opposed to [started]
  /// creating a new one.
  const factory TailoringEvent.loadRequested(String tailoringId) = TailoringLoadRequested;

  /// Cancels an in-flight [TailoringStarted] request. A no-op once the
  /// request has already resolved.
  const factory TailoringEvent.cancelRequested() = TailoringCancelRequested;

  /// Flips whether [bulletId] is currently marked to be applied. Only
  /// meaningful for bullets whose diff status is `modified` — the caller is
  /// responsible for not offering this for `unchanged`/`flagged_invented`
  /// bullets, since the server ignores them either way.
  const factory TailoringEvent.bulletToggled(String bulletId) = TailoringBulletToggled;

  const factory TailoringEvent.acceptRequested() = TailoringAcceptRequested;
}
