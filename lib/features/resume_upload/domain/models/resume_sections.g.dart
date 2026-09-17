// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resume_sections.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResumeSections _$ResumeSectionsFromJson(
  Map<String, dynamic> json,
) => _ResumeSections(
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

Map<String, dynamic> _$ResumeSectionsToJson(_ResumeSections instance) =>
    <String, dynamic>{
      'parsedContact': instance.parsedContact?.toJson(),
      'summary': instance.summary,
      'experience': instance.experience?.map((e) => e.toJson()).toList(),
      'education': instance.education?.map((e) => e.toJson()).toList(),
      'skills': instance.skills,
    };
