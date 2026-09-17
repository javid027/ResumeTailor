import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:resume_tailor/core/error/api_exception.dart';
import 'package:resume_tailor/features/auth/domain/models/auth_response.dart';
import 'package:resume_tailor/features/auth/domain/models/auth_user.dart';
import 'package:resume_tailor/features/auth/domain/repositories/auth_repository.dart';
import 'package:resume_tailor/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:resume_tailor/features/auth/presentation/bloc/auth_event.dart';
import 'package:resume_tailor/features/auth/presentation/bloc/auth_state.dart';

class _MockAuthRepository extends Mock implements AuthRepository {}

void main() {
  late _MockAuthRepository authRepository;

  const user = AuthUser(id: 'user-1', email: 'jane@example.com');
  final authResponse = AuthResponse(accessToken: 'a', refreshToken: 'r', user: user);

  setUp(() {
    authRepository = _MockAuthRepository();
  });

  // The bloc dispatches AuthEvent.checkRequested() from its own constructor,
  // so every test needs restoreSession() stubbed even when it isn't the
  // behavior under test.
  AuthBloc buildBloc({bool sessionRestored = false}) {
    when(() => authRepository.restoreSession()).thenAnswer((_) async => sessionRestored);
    return AuthBloc(authRepository);
  }

  group('startup session check', () {
    blocTest<AuthBloc, AuthState>(
      'emits [loading, unauthenticated] when there is no persisted session',
      setUp: () => when(() => authRepository.restoreSession()).thenAnswer((_) async => false),
      build: () => AuthBloc(authRepository),
      expect: () => [const AuthState.loading(), const AuthState.unauthenticated()],
    );

    blocTest<AuthBloc, AuthState>(
      'emits [loading, authenticated] when the refresh token is still valid',
      setUp: () => when(() => authRepository.restoreSession()).thenAnswer((_) async => true),
      build: () => AuthBloc(authRepository),
      expect: () => [const AuthState.loading(), const AuthState.authenticated()],
    );
  });

  group('login', () {
    blocTest<AuthBloc, AuthState>(
      'emits [loading, unauthenticated, loading, authenticated] on success',
      build: () => buildBloc(),
      act: (bloc) => bloc.add(const AuthEvent.loginRequested(email: 'jane@example.com', password: 'password123')),
      setUp: () => when(() => authRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenAnswer((_) async => authResponse),
      skip: 2,
      expect: () => [const AuthState.submitting(), AuthState.authenticated(user: user)],
    );

    blocTest<AuthBloc, AuthState>(
      'emits a mapped failure message on invalid credentials',
      build: () => buildBloc(),
      act: (bloc) => bloc.add(const AuthEvent.loginRequested(email: 'jane@example.com', password: 'wrong')),
      setUp: () => when(() => authRepository.login(
            email: any(named: 'email'),
            password: any(named: 'password'),
          )).thenThrow(const ApiException(
        code: 'AUTH_INVALID_CREDENTIALS',
        message: 'Invalid email or password',
        details: {},
        statusCode: 401,
      )),
      skip: 2,
      expect: () => [
        const AuthState.submitting(),
        const AuthState.failure(code: 'AUTH_INVALID_CREDENTIALS', message: 'Incorrect email or password.'),
      ],
    );
  });

  group('logout', () {
    blocTest<AuthBloc, AuthState>(
      'clears the session and emits unauthenticated',
      build: () => buildBloc(sessionRestored: true),
      act: (bloc) => bloc.add(const AuthEvent.logoutRequested()),
      setUp: () => when(() => authRepository.logout()).thenAnswer((_) async {}),
      skip: 2,
      expect: () => [const AuthState.unauthenticated()],
      verify: (_) => verify(() => authRepository.logout()).called(1),
    );
  });
}
