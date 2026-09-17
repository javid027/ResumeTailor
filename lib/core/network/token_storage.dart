import 'dart:async';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

/// Holds the current access/refresh token pair.
///
/// Exposes synchronous getters for the auth interceptor (every request needs
/// the access token without an async hop), backed by an in-memory cache that
/// is write-through persisted to secure storage so a session survives an app
/// restart. Call [hydrate] once at startup, before the first request.
abstract class TokenStorage {
  String? get accessToken;
  String? get refreshToken;

  Future<void> hydrate();

  void saveTokens({required String accessToken, required String refreshToken});
  void clear();
}

@LazySingleton(as: TokenStorage)
class SecureTokenStorage implements TokenStorage {
  SecureTokenStorage(this._secureStorage);

  static const _accessTokenKey = 'access_token';
  static const _refreshTokenKey = 'refresh_token';

  final FlutterSecureStorage _secureStorage;

  String? _accessToken;
  String? _refreshToken;

  @override
  String? get accessToken => _accessToken;

  @override
  String? get refreshToken => _refreshToken;

  @override
  Future<void> hydrate() async {
    // A read failure here (corrupted storage, a browser-specific secure
    // storage quirk, etc.) must never crash app startup — fall back to
    // "no session" and let the user log in again.
    try {
      _accessToken = await _secureStorage.read(key: _accessTokenKey);
      _refreshToken = await _secureStorage.read(key: _refreshTokenKey);
    } catch (_) {
      _accessToken = null;
      _refreshToken = null;
      unawaited(_secureStorage.deleteAll());
    }
  }

  @override
  void saveTokens({required String accessToken, required String refreshToken}) {
    _accessToken = accessToken;
    _refreshToken = refreshToken;
    unawaited(_secureStorage.write(key: _accessTokenKey, value: accessToken));
    unawaited(_secureStorage.write(key: _refreshTokenKey, value: refreshToken));
  }

  @override
  void clear() {
    _accessToken = null;
    _refreshToken = null;
    unawaited(_secureStorage.deleteAll());
  }
}
