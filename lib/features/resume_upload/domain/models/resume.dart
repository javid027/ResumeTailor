import 'package:freezed_annotation/freezed_annotation.dart';

import 'education_entry.dart';
import 'experience_entry.dart';
import 'parsed_contact.dart';

part 'resume.freezed.dart';
part 'resume.g.dart';

@freezed
sealed class Resume with _$Resume {
  const factory Resume({
    required String id,
    required String userId,
    required String rawFileUrl,
    required DateTime createdAt,
    required DateTime updatedAt,
    ParsedContact? parsedContact,
    String? summary,
    List<ExperienceEntry>? experience,
    List<EducationEntry>? education,
    List<String>? skills,
  }) = _Resume;

  factory Resume.fromJson(Map<String, dynamic> json) => _$ResumeFromJson(json);
}
