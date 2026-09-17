import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/job_description.dart';

@injectable
class JobDescriptionRemoteDataSource {
  JobDescriptionRemoteDataSource(this._dio);

  final Dio _dio;

  Future<JobDescription> create({required String rawText}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/job-descriptions',
      data: {'rawText': rawText},
    );
    return JobDescription.fromJson(response.data!);
  }
}
