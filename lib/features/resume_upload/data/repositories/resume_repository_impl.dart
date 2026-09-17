import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/api_exception.dart';
import '../../domain/models/education_entry.dart';
import '../../domain/models/experience_entry.dart';
import '../../domain/models/parsed_contact.dart';
import '../../domain/models/resume.dart';
import '../../domain/repositories/resume_repository.dart';
import '../datasources/resume_remote_data_source.dart';

@LazySingleton(as: ResumeRepository)
class ResumeRepositoryImpl implements ResumeRepository {
  ResumeRepositoryImpl(this._remoteDataSource);

  final ResumeRemoteDataSource _remoteDataSource;

  @override
  Future<Resume> uploadResume({required Uint8List fileBytes, required String fileName}) async {
    try {
      return await _remoteDataSource.uploadResume(fileBytes: fileBytes, fileName: fileName);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<Resume> patchResume(
    String id, {
    ParsedContact? parsedContact,
    String? summary,
    List<ExperienceEntry>? experience,
    List<EducationEntry>? education,
    List<String>? skills,
  }) async {
    try {
      return await _remoteDataSource.patchResume(
        id,
        parsedContact: parsedContact,
        summary: summary,
        experience: experience,
        education: education,
        skills: skills,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
