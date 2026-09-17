// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Resume _$ResumeFromJson(Map<String, dynamic> json) => _Resume(
  id: json['id'] as String,
  userId: json['userId'] as String,
  rawFileUrl: json['rawFileUrl'] as String,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
  parsedContact: json['parsedContact'] == null
      ? null
      : ParsedContact.fromJson(json['parsedContact'] as Map<String, dynamic>),
  summary: json['summary'] as String?,
  experience: (json['experience'] as List<dynamic>?)
      ?.map((e) => ExperienceEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
  education: (json['education'] as List<dynamic>?)
      ?.map((e) => EducationEntry.fromJson(e as Map<String, dynamic>))
      .toList(),
  skills: (json['skills'] as List<dynamic>?)?.map((e) => e as String).toList(),
);

Map<String, dynamic> _$ResumeToJson(_Resume instance) => <String, dynamic>{
  'id': instance.id,
  'userId': instance.userId,
  'rawFileUrl': instance.rawFileUrl,
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
  'parsedContact': instance.parsedContact?.toJson(),
  'summary': instance.summary,
  'experience': instance.experience?.map((e) => e.toJson()).toList(),
  'education': instance.education?.map((e) => e.toJson()).toList(),
  'skills': instance.skills,
};
