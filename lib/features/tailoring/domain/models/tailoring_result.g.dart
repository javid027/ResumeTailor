// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tailoring_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TailoringResult _$TailoringResultFromJson(Map<String, dynamic> json) =>
    _TailoringResult(
      id: json['id'] as String,
      resumeId: json['resumeId'] as String,
      jobDescriptionId: json['jobDescriptionId'] as String,
      originalSections: ResumeSections.fromJson(
        json['originalSections'] as Map<String, dynamic>,
      ),
      tailoredSections: json['tailoredSections'] == null
          ? null
          : ResumeSections.fromJson(
              json['tailoredSections'] as Map<String, dynamic>,
            ),
      perBulletDiffs: (json['perBulletDiffs'] as List<dynamic>)
          .map((e) => BulletDiff.fromJson(e as Map<String, dynamic>))
          .toList(),
      atsScoreBefore: (json['atsScoreBefore'] as num).toDouble(),
      atsScoreAfter: (json['atsScoreAfter'] as num?)?.toDouble(),
      unmatchedRequirements: (json['unmatchedRequirements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      status: $enumDecode(_$TailoringStatusEnumMap, json['status']),
      failureReason: json['failureReason'] as String?,
      consentGivenAt: DateTime.parse(json['consentGivenAt'] as String),
      finalSections: json['finalSections'] == null
          ? null
          : ResumeSections.fromJson(
              json['finalSections'] as Map<String, dynamic>,
            ),
      acceptedBulletIds: (json['acceptedBulletIds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      acceptedAt: json['acceptedAt'] == null
          ? null
          : DateTime.parse(json['acceptedAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$TailoringResultToJson(_TailoringResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resumeId': instance.resumeId,
      'jobDescriptionId': instance.jobDescriptionId,
      'originalSections': instance.originalSections.toJson(),
      'tailoredSections': instance.tailoredSections?.toJson(),
      'perBulletDiffs': instance.perBulletDiffs.map((e) => e.toJson()).toList(),
      'atsScoreBefore': instance.atsScoreBefore,
      'atsScoreAfter': instance.atsScoreAfter,
      'unmatchedRequirements': instance.unmatchedRequirements,
      'status': _$TailoringStatusEnumMap[instance.status]!,
      'failureReason': instance.failureReason,
      'consentGivenAt': instance.consentGivenAt.toIso8601String(),
      'finalSections': instance.finalSections?.toJson(),
      'acceptedBulletIds': instance.acceptedBulletIds,
      'acceptedAt': instance.acceptedAt?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

const _$TailoringStatusEnumMap = {
  TailoringStatus.pending: 'pending',
  TailoringStatus.completed: 'completed',
  TailoringStatus.failed: 'failed',
};
