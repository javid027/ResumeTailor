import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/network/token_storage.dart';
import '../../domain/models/auth_response.dart';
import '../../domain/models/token_pair.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl(this._remoteDataSource, this._tokenStorage);

  final AuthRemoteDataSource _remoteDataSource;
  final TokenStorage _tokenStorage;

  @override
  Future<AuthResponse> register({required String email, required String password}) async {
    try {
      final result = await _remoteDataSource.register(email: email, password: password);
      _tokenStorage.saveTokens(accessToken: result.accessToken, refreshToken: result.refreshToken);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<AuthResponse> login({required String email, required String password}) async {
    try {
      final result = await _remoteDataSource.login(email: email, password: password);
      _tokenStorage.saveTokens(accessToken: result.accessToken, refreshToken: result.refreshToken);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<TokenPair> refresh({required String refreshToken}) async {
    try {
      final result = await _remoteDataSource.refresh(refreshToken: refreshToken);
      _tokenStorage.saveTokens(accessToken: result.accessToken, refreshToken: result.refreshToken);
      return result;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<bool> restoreSession() async {
    final storedRefreshToken = _tokenStorage.refreshToken;
    if (storedRefreshToken == null) return false;

    try {
      await refresh(refreshToken: storedRefreshToken);
      return true;
    } on ApiException {
      _tokenStorage.clear();
      return false;
    }
  }

  @override
  Future<void> logout() async {
    _tokenStorage.clear();
  }
}
