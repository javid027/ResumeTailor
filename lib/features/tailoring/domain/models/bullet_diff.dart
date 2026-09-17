import 'package:freezed_annotation/freezed_annotation.dart';

part 'bullet_diff.freezed.dart';
part 'bullet_diff.g.dart';

enum BulletDiffStatus {
  unchanged,
  modified,
  @JsonValue('flagged_invented')
  flaggedInvented,
}

@freezed
sealed class BulletDiff with _$BulletDiff {
  const factory BulletDiff({
    required String sectionId,
    required String bulletId,
    required String original,
    required String suggested,
    required BulletDiffStatus status,
  }) = _BulletDiff;

  factory BulletDiff.fromJson(Map<String, dynamic> json) => _$BulletDiffFromJson(json);
}
