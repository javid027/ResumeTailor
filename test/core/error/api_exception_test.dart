import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:resume_tailor/core/error/api_exception.dart';

void main() {
  group('ApiException.fromDioException', () {
    test('parses the documented { error: { code, message, details } } shape', () {
      final requestOptions = RequestOptions(path: '/resumes/123');
      final dioException = DioException(
        requestOptions: requestOptions,
        response: Response(
          requestOptions: requestOptions,
          statusCode: 404,
          data: {
            'error': {
              'code': 'RESUME_NOT_FOUND',
              'message': 'Resume not found',
              'details': <String, dynamic>{},
            },
          },
        ),
      );

      final result = ApiException.fromDioException(dioException);

      expect(result.code, 'RESUME_NOT_FOUND');
      expect(result.message, 'Resume not found');
      expect(result.statusCode, 404);
    });

    test('falls back to NETWORK_TIMEOUT when there is no response body', () {
      final requestOptions = RequestOptions(path: '/health');
      final dioException = DioException(
        requestOptions: requestOptions,
        type: DioExceptionType.connectionTimeout,
      );

      final result = ApiException.fromDioException(dioException);

      expect(result.code, 'NETWORK_TIMEOUT');
    });
  });
}
