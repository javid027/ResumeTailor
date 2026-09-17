import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/api_exception.dart';
import '../../domain/models/history_page.dart';
import '../../domain/repositories/history_repository.dart';
import '../datasources/history_remote_data_source.dart';

@LazySingleton(as: HistoryRepository)
class HistoryRepositoryImpl implements HistoryRepository {
  HistoryRepositoryImpl(this._remoteDataSource);

  final HistoryRemoteDataSource _remoteDataSource;

  @override
  Future<HistoryPage> getHistory({int page = 1, int limit = 20}) async {
    try {
      return await _remoteDataSource.getHistory(page: page, limit: limit);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
