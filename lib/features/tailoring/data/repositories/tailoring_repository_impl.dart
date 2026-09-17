import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/api_exception.dart';
import '../../domain/models/exported_file.dart';
import '../../domain/models/tailoring_result.dart';
import '../../domain/repositories/tailoring_repository.dart';
import '../datasources/tailoring_remote_data_source.dart';

@LazySingleton(as: TailoringRepository)
class TailoringRepositoryImpl implements TailoringRepository {
  TailoringRepositoryImpl(this._remoteDataSource);

  final TailoringRemoteDataSource _remoteDataSource;

  @override
  Future<TailoringResult> create({
    required String resumeId,
    required String jobDescriptionId,
    required bool consent,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _remoteDataSource.create(
        resumeId: resumeId,
        jobDescriptionId: jobDescriptionId,
        consent: consent,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<TailoringResult> get(String id) async {
    try {
      return await _remoteDataSource.get(id);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<TailoringResult> accept(String id, {List<String> acceptedBulletIds = const []}) async {
    try {
      return await _remoteDataSource.accept(id, acceptedBulletIds: acceptedBulletIds);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<ExportedFile> export(String id, {required ExportFormat format}) async {
    try {
      return await _remoteDataSource.export(id, format: format);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
