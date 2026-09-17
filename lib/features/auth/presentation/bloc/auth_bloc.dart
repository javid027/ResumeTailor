import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/error/api_exception.dart';
import '../../../../core/error/error_message_mapper.dart';
import '../../domain/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

/// Single, app-wide auth bloc: the router's redirect guard and every screen
/// that cares about auth status share this instance (registered as a
/// singleton), rather than each screen owning its own auth Cubit.
@lazySingleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._authRepository) : super(const AuthState.initial()) {
    on<AuthEvent>((event, emit) => switch (event) {
          AuthCheckRequested() => _onCheckRequested(emit),
          AuthLoginRequested(:final email, :final password) => _onLogin(email, password, emit),
          AuthRegisterRequested(:final email, :final password) =>
            _onRegister(email, password, emit),
          AuthLogoutRequested() => _onLogout(emit),
        });
    add(const AuthEvent.checkRequested());
  }

  final AuthRepository _authRepository;

  Future<void> _onCheckRequested(Emitter<AuthState> emit) async {
    emit(const AuthState.loading());
    final restored = await _authRepository.restoreSession();
    emit(restored ? const AuthState.authenticated() : const AuthState.unauthenticated());
  }

  Future<void> _onLogin(String email, String password, Emitter<AuthState> emit) async {
    emit(const AuthState.submitting());
    try {
      final result = await _authRepository.login(email: email, password: password);
      emit(AuthState.authenticated(user: result.user));
    } on ApiException catch (e) {
      emit(AuthState.failure(code: e.code, message: userMessageFor(e)));
    }
  }

  Future<void> _onRegister(String email, String password, Emitter<AuthState> emit) async {
    emit(const AuthState.submitting());
    try {
      final result = await _authRepository.register(email: email, password: password);
      emit(AuthState.authenticated(user: result.user));
    } on ApiException catch (e) {
      emit(AuthState.failure(code: e.code, message: userMessageFor(e)));
    }
  }

  Future<void> _onLogout(Emitter<AuthState> emit) async {
    await _authRepository.logout();
    emit(const AuthState.unauthenticated());
  }
}
