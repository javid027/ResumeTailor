// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ExperienceEntry _$ExperienceEntryFromJson(Map<String, dynamic> json) =>
    _ExperienceEntry(
      company: json['company'] as String?,
      title: json['title'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      bullets: (json['bullets'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$ExperienceEntryToJson(_ExperienceEntry instance) =>
    <String, dynamic>{
      'company': instance.company,
      'title': instance.title,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'bullets': instance.bullets,
    };
