import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resume_tailor/core/error/api_exception.dart';
import 'package:resume_tailor/core/network/token_storage.dart';
import 'package:resume_tailor/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:resume_tailor/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:resume_tailor/features/auth/domain/models/auth_response.dart';
import 'package:resume_tailor/features/auth/domain/models/auth_user.dart';
import 'package:resume_tailor/features/auth/domain/models/token_pair.dart';

class _MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class _MockTokenStorage extends Mock implements TokenStorage {}

void main() {
  late _MockAuthRemoteDataSource remoteDataSource;
  late _MockTokenStorage tokenStorage;
  late AuthRepositoryImpl repository;

  setUp(() {
    remoteDataSource = _MockAuthRemoteDataSource();
    tokenStorage = _MockTokenStorage();
    repository = AuthRepositoryImpl(remoteDataSource, tokenStorage);
  });

  final authResponse = AuthResponse(
    accessToken: 'access-123',
    refreshToken: 'refresh-123',
    user: const AuthUser(id: 'user-1', email: 'jane@example.com'),
  );

  group('login', () {
    test('saves the token pair to TokenStorage on success', () async {
      when(() => remoteDataSource.login(email: any(named: 'email'), password: any(named: 'password')))
          .thenAnswer((_) async => authResponse);

      final result = await repository.login(email: 'jane@example.com', password: 'password123');

      expect(result, authResponse);
      verify(() => tokenStorage.saveTokens(accessToken: 'access-123', refreshToken: 'refresh-123'))
          .called(1);
    });

    test('maps a DioException to ApiException using the response error shape', () async {
      final requestOptions = RequestOptions(path: '/auth/login');
      when(() => remoteDataSource.login(email: any(named: 'email'), password: any(named: 'password')))
          .thenThrow(DioException(
        requestOptions: requestOptions,
        response: Response(
          requestOptions: requestOptions,
          statusCode: 401,
          data: {
            'error': {
              'code': 'AUTH_INVALID_CREDENTIALS',
              'message': 'Invalid email or password',
              'details': <String, dynamic>{},
            },
          },
        ),
      ));

      await expectLater(
        () => repository.login(email: 'jane@example.com', password: 'wrong'),
        throwsA(isA<ApiException>().having((e) => e.code, 'code', 'AUTH_INVALID_CREDENTIALS')),
      );
      verifyNever(() => tokenStorage.saveTokens(
            accessToken: any(named: 'accessToken'),
            refreshToken: any(named: 'refreshToken'),
          ));
    });
  });

  group('restoreSession', () {
    test('returns false without calling the API when there is no stored refresh token', () async {
      when(() => tokenStorage.refreshToken).thenReturn(null);

      final result = await repository.restoreSession();

      expect(result, isFalse);
      verifyNever(() => remoteDataSource.refresh(refreshToken: any(named: 'refreshToken')));
    });

    test('refreshes and persists the rotated pair when the stored token is valid', () async {
      when(() => tokenStorage.refreshToken).thenReturn('stored-refresh');
      when(() => remoteDataSource.refresh(refreshToken: 'stored-refresh')).thenAnswer(
        (_) async => const TokenPair(accessToken: 'new-access', refreshToken: 'new-refresh'),
      );

      final result = await repository.restoreSession();

      expect(result, isTrue);
      verify(() => tokenStorage.saveTokens(accessToken: 'new-access', refreshToken: 'new-refresh'))
          .called(1);
    });

    test('clears storage and returns false when the stored token is rejected', () async {
      final requestOptions = RequestOptions(path: '/auth/refresh');
      when(() => tokenStorage.refreshToken).thenReturn('stale-refresh');
      when(() => remoteDataSource.refresh(refreshToken: 'stale-refresh')).thenThrow(DioException(
        requestOptions: requestOptions,
        response: Response(
          requestOptions: requestOptions,
          statusCode: 401,
          data: {
            'error': {
              'code': 'AUTH_INVALID_REFRESH_TOKEN',
              'message': 'Invalid refresh token',
              'details': <String, dynamic>{},
            },
          },
        ),
      ));

      final result = await repository.restoreSession();

      expect(result, isFalse);
      verify(() => tokenStorage.clear()).called(1);
    });
  });

  group('logout', () {
    test('clears the token storage', () async {
      await repository.logout();

      verify(() => tokenStorage.clear()).called(1);
    });
  });
}
