import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/exported_file.dart';
import '../../domain/models/tailoring_result.dart';
import '../../domain/repositories/tailoring_repository.dart';

@injectable
class TailoringRemoteDataSource {
  TailoringRemoteDataSource(this._dio);

  final Dio _dio;

  static const _createReceiveTimeout = Duration(seconds: 90);

  Future<TailoringResult> create({
    required String resumeId,
    required String jobDescriptionId,
    required bool consent,
    CancelToken? cancelToken,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/tailoring',
      data: {
        'resumeId': resumeId,
        'jobDescriptionId': jobDescriptionId,
        'consent': consent,
      },
      // The LLM call behind this endpoint can run well past the client's
      // default timeout, unlike every other (fast, deterministic) endpoint.
      options: Options(receiveTimeout: _createReceiveTimeout),
      cancelToken: cancelToken,
    );
    return TailoringResult.fromJson(response.data!);
  }

  Future<TailoringResult> get(String id) async {
    final response = await _dio.get<Map<String, dynamic>>('/tailoring/$id');
    return TailoringResult.fromJson(response.data!);
  }

  Future<TailoringResult> accept(String id, {List<String> acceptedBulletIds = const []}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/tailoring/$id/accept',
      data: {'acceptedBulletIds': acceptedBulletIds},
    );
    return TailoringResult.fromJson(response.data!);
  }

  Future<ExportedFile> export(String id, {required ExportFormat format}) async {
    final response = await _dio.get<List<int>>(
      '/tailoring/$id/export',
      queryParameters: {'format': format.value},
      options: Options(responseType: ResponseType.bytes),
    );

    final disposition = response.headers.value('content-disposition');
    final filename = _filenameFrom(disposition) ?? 'resume.${format.value}';

    return ExportedFile(bytes: Uint8List.fromList(response.data!), filename: filename);
  }

  String? _filenameFrom(String? contentDisposition) {
    if (contentDisposition == null) return null;
    final match = RegExp('filename="?([^"]+)"?').firstMatch(contentDisposition);
    return match?.group(1);
  }
}
