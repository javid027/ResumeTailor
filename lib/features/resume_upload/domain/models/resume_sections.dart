import 'package:freezed_annotation/freezed_annotation.dart';

import 'education_entry.dart';
import 'experience_entry.dart';
import 'parsed_contact.dart';

part 'resume_sections.freezed.dart';
part 'resume_sections.g.dart';

/// Shared shape for a resume's tailorable content — mirrors `ResumeSections`
/// in openapi.yaml, used for `originalSections`/`tailoredSections`/`finalSections`.
@freezed
sealed class ResumeSections with _$ResumeSections {
  const factory ResumeSections({
    ParsedContact? parsedContact,
    String? summary,
    List<ExperienceEntry>? experience,
    List<EducationEntry>? education,
    List<String>? skills,
  }) = _ResumeSections;

  factory ResumeSections.fromJson(Map<String, dynamic> json) => _$ResumeSectionsFromJson(json);
}
