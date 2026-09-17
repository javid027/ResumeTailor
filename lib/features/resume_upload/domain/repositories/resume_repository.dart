import 'dart:typed_data';

import '../models/education_entry.dart';
import '../models/experience_entry.dart';
import '../models/parsed_contact.dart';
import '../models/resume.dart';

abstract class ResumeRepository {
  /// Uploads a PDF/DOCX resume (max 5MB, validated server-side by magic bytes).
  Future<Resume> uploadResume({required Uint8List fileBytes, required String fileName});

  /// Corrects one or more parsed fields. At least one argument must be
  /// non-null — the server rejects an empty patch (`VALIDATION_ERROR`).
  Future<Resume> patchResume(
    String id, {
    ParsedContact? parsedContact,
    String? summary,
    List<ExperienceEntry>? experience,
    List<EducationEntry>? education,
    List<String>? skills,
  });
}
