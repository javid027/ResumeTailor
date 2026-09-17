// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bullet_diff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BulletDiff _$BulletDiffFromJson(Map<String, dynamic> json) => _BulletDiff(
  sectionId: json['sectionId'] as String,
  bulletId: json['bulletId'] as String,
  original: json['original'] as String,
  suggested: json['suggested'] as String,
  status: $enumDecode(_$BulletDiffStatusEnumMap, json['status']),
);

Map<String, dynamic> _$BulletDiffToJson(_BulletDiff instance) =>
    <String, dynamic>{
      'sectionId': instance.sectionId,
      'bulletId': instance.bulletId,
      'original': instance.original,
      'suggested': instance.suggested,
      'status': _$BulletDiffStatusEnumMap[instance.status]!,
    };

const _$BulletDiffStatusEnumMap = {
  BulletDiffStatus.unchanged: 'unchanged',
  BulletDiffStatus.modified: 'modified',
  BulletDiffStatus.flaggedInvented: 'flagged_invented',
};
