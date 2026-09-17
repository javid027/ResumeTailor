import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/api_exception.dart';
import '../../domain/models/job_description.dart';
import '../../domain/repositories/job_description_repository.dart';
import '../datasources/job_description_remote_data_source.dart';

@LazySingleton(as: JobDescriptionRepository)
class JobDescriptionRepositoryImpl implements JobDescriptionRepository {
  JobDescriptionRepositoryImpl(this._remoteDataSource);

  final JobDescriptionRemoteDataSource _remoteDataSource;

  @override
  Future<JobDescription> create({required String rawText}) async {
    try {
      return await _remoteDataSource.create(rawText: rawText);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
