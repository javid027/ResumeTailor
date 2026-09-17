import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/education_entry.dart';
import '../../domain/models/experience_entry.dart';
import '../../domain/models/parsed_contact.dart';
import '../../domain/models/resume.dart';

@injectable
class ResumeRemoteDataSource {
  ResumeRemoteDataSource(this._dio);

  final Dio _dio;

  Future<Resume> uploadResume({required Uint8List fileBytes, required String fileName}) async {
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(fileBytes, filename: fileName),
    });
    final response = await _dio.post<Map<String, dynamic>>('/resumes', data: formData);
    return Resume.fromJson(response.data!);
  }

  Future<Resume> patchResume(
    String id, {
    ParsedContact? parsedContact,
    String? summary,
    List<ExperienceEntry>? experience,
    List<EducationEntry>? education,
    List<String>? skills,
  }) async {
    final body = <String, dynamic>{
      if (parsedContact != null) 'parsedContact': parsedContact.toJson(),
      'summary': ?summary,
      if (experience != null) 'experience': experience.map((e) => e.toJson()).toList(),
      if (education != null) 'education': education.map((e) => e.toJson()).toList(),
      'skills': ?skills,
    };
    final response = await _dio.patch<Map<String, dynamic>>('/resumes/$id', data: body);
    return Resume.fromJson(response.data!);
  }
}
