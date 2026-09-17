import 'package:dio/dio.dart';

/// Mirrors the API's documented error shape:
/// `{ "error": { "code": "...", "message": "...", "details": {} } }`.
///
/// Blocs map [code] to a user-facing message — this layer only surfaces the
/// contract's fields untouched.
class ApiException implements Exception {
  const ApiException({
    required this.code,
    required this.message,
    required this.details,
    this.statusCode,
  });

  factory ApiException.fromDioException(DioException e) {
    final data = e.response?.data;
    if (data is Map<String, dynamic> && data['error'] is Map<String, dynamic>) {
      final error = data['error'] as Map<String, dynamic>;
      return ApiException(
        code: error['code'] as String? ?? 'UNKNOWN_ERROR',
        message: error['message'] as String? ?? 'Something went wrong.',
        details: (error['details'] as Map<String, dynamic>?) ?? const {},
        statusCode: e.response?.statusCode,
      );
    }

    return ApiException(
      code: switch (e.type) {
        DioExceptionType.connectionTimeout ||
        DioExceptionType.sendTimeout ||
        DioExceptionType.receiveTimeout =>
          'NETWORK_TIMEOUT',
        DioExceptionType.connectionError => 'NETWORK_UNAVAILABLE',
        DioExceptionType.cancel => 'REQUEST_CANCELLED',
        _ => 'UNKNOWN_ERROR',
      },
      message: e.message ?? 'Something went wrong.',
      details: const {},
      statusCode: e.response?.statusCode,
    );
  }

  final String code;
  final String message;
  final Map<String, dynamic> details;
  final int? statusCode;

  @override
  String toString() => 'ApiException($code, $message)';
}
