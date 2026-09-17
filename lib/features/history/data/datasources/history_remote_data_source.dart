import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/history_page.dart';

@injectable
class HistoryRemoteDataSource {
  HistoryRemoteDataSource(this._dio);

  final Dio _dio;

  Future<HistoryPage> getHistory({int page = 1, int limit = 20}) async {
    final response = await _dio.get<Map<String, dynamic>>(
      '/history',
      queryParameters: {'page': page, 'limit': limit},
    );
    return HistoryPage.fromJson(response.data!);
  }
}
