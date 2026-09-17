import '../models/auth_response.dart';
import '../models/token_pair.dart';

abstract class AuthRepository {
  Future<AuthResponse> register({required String email, required String password});

  Future<AuthResponse> login({required String email, required String password});

  Future<TokenPair> refresh({required String refreshToken});

  /// Attempts to restore a session from a persisted refresh token. Returns
  /// `false` (and clears any stored token) if there is none, or if it has
  /// expired/been rotated elsewhere.
  Future<bool> restoreSession();

  /// Clears the local session. There is no `/auth/logout` endpoint — the
  /// server has no notion of a login session beyond the tokens themselves.
  Future<void> logout();
}
