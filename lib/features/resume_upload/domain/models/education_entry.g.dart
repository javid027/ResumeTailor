// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EducationEntry _$EducationEntryFromJson(Map<String, dynamic> json) =>
    _EducationEntry(
      institution: json['institution'] as String?,
      degree: json['degree'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
    );

Map<String, dynamic> _$EducationEntryToJson(_EducationEntry instance) =>
    <String, dynamic>{
      'institution': instance.institution,
      'degree': instance.degree,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
    };
