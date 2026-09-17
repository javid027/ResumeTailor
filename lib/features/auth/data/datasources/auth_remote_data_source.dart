import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domain/models/auth_response.dart';
import '../../domain/models/token_pair.dart';

@injectable
class AuthRemoteDataSource {
  AuthRemoteDataSource(this._dio);

  final Dio _dio;

  Future<AuthResponse> register({required String email, required String password}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/register',
      data: {'email': email, 'password': password},
    );
    return AuthResponse.fromJson(response.data!);
  }

  Future<AuthResponse> login({required String email, required String password}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    return AuthResponse.fromJson(response.data!);
  }

  Future<TokenPair> refresh({required String refreshToken}) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/auth/refresh',
      data: {'refreshToken': refreshToken},
    );
    return TokenPair.fromJson(response.data!);
  }
}
