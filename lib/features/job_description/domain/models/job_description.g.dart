// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_description.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobDescription _$JobDescriptionFromJson(Map<String, dynamic> json) =>
    _JobDescription(
      id: json['id'] as String,
      userId: json['userId'] as String,
      rawText: json['rawText'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      keywords: (json['keywords'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      requirements: (json['requirements'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$JobDescriptionToJson(_JobDescription instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'rawText': instance.rawText,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'keywords': instance.keywords,
      'requirements': instance.requirements,
    };
