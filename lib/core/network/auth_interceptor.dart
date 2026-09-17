import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'api_constants.dart';
import 'token_storage.dart';

/// Attaches the bearer access token to every request and, on a 401, rotates
/// the refresh token once and retries the original request — matching the
/// API's documented refresh-token-rotation behavior.
@injectable
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._tokenStorage);

  final TokenStorage _tokenStorage;
  Future<bool>? _refreshing;

  static const _refreshPath = '/auth/refresh';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = _tokenStorage.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(DioException err, ErrorInterceptorHandler handler) async {
    final isRefreshCall = err.requestOptions.path.contains(_refreshPath);
    if (err.response?.statusCode != 401 || isRefreshCall) {
      return handler.next(err);
    }

    final refreshed = await _refreshTokens();
    if (!refreshed) {
      _tokenStorage.clear();
      return handler.next(err);
    }

    try {
      final retryDio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
      final retried = await retryDio.fetch<dynamic>(
        err.requestOptions
          ..headers['Authorization'] = 'Bearer ${_tokenStorage.accessToken}',
      );
      handler.resolve(retried);
    } on DioException catch (e) {
      handler.next(e);
    }
  }

  Future<bool> _refreshTokens() {
    return _refreshing ??= _performRefresh().whenComplete(() => _refreshing = null);
  }

  Future<bool> _performRefresh() async {
    final refreshToken = _tokenStorage.refreshToken;
    if (refreshToken == null) return false;

    try {
      final dio = Dio(BaseOptions(baseUrl: ApiConstants.baseUrl));
      final response = await dio.post<Map<String, dynamic>>(
        _refreshPath,
        data: {'refreshToken': refreshToken},
      );
      final data = response.data!;
      _tokenStorage.saveTokens(
        accessToken: data['accessToken'] as String,
        refreshToken: data['refreshToken'] as String,
      );
      return true;
    } on DioException {
      return false;
    }
  }
}
