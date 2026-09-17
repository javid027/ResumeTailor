// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryItemResume _$HistoryItemResumeFromJson(Map<String, dynamic> json) =>
    _HistoryItemResume(id: json['id'] as String, name: json['name'] as String?);

Map<String, dynamic> _$HistoryItemResumeToJson(_HistoryItemResume instance) =>
    <String, dynamic>{'id': instance.id, 'name': instance.name};

_HistoryItemJobDescription _$HistoryItemJobDescriptionFromJson(
  Map<String, dynamic> json,
) => _HistoryItemJobDescription(
  id: json['id'] as String,
  excerpt: json['excerpt'] as String,
  keywords: (json['keywords'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$HistoryItemJobDescriptionToJson(
  _HistoryItemJobDescription instance,
) => <String, dynamic>{
  'id': instance.id,
  'excerpt': instance.excerpt,
  'keywords': instance.keywords,
};

_HistoryItem _$HistoryItemFromJson(Map<String, dynamic> json) => _HistoryItem(
  id: json['id'] as String,
  status: $enumDecode(_$TailoringStatusEnumMap, json['status']),
  atsScoreBefore: (json['atsScoreBefore'] as num).toDouble(),
  atsScoreAfter: (json['atsScoreAfter'] as num?)?.toDouble(),
  unmatchedRequirements: (json['unmatchedRequirements'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  acceptedAt: json['acceptedAt'] == null
      ? null
      : DateTime.parse(json['acceptedAt'] as String),
  resume: HistoryItemResume.fromJson(json['resume'] as Map<String, dynamic>),
  jobDescription: HistoryItemJobDescription.fromJson(
    json['jobDescription'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$HistoryItemToJson(_HistoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': _$TailoringStatusEnumMap[instance.status]!,
      'atsScoreBefore': instance.atsScoreBefore,
      'atsScoreAfter': instance.atsScoreAfter,
      'unmatchedRequirements': instance.unmatchedRequirements,
      'createdAt': instance.createdAt.toIso8601String(),
      'acceptedAt': instance.acceptedAt?.toIso8601String(),
      'resume': instance.resume.toJson(),
      'jobDescription': instance.jobDescription.toJson(),
    };

const _$TailoringStatusEnumMap = {
  TailoringStatus.pending: 'pending',
  TailoringStatus.completed: 'completed',
  TailoringStatus.failed: 'failed',
};
