import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;

class ApiConstants {
  ApiConstants._();

  /// Override for a physical device on the same LAN as the dev machine —
  /// neither `localhost` nor `10.0.2.2` reach the host machine from a real
  /// phone, only its actual network IP does. Pass at build/run time:
  /// `flutter run --dart-define=API_HOST=192.168.x.x`.
  static const _hostOverride = String.fromEnvironment('API_HOST');

  /// The Android *emulator*'s `localhost` refers to the emulator itself, not
  /// the host machine — `10.0.2.2` is the emulator's alias for the host's
  /// loopback interface. Every other target (web, desktop, iOS simulator)
  /// shares the host's network namespace, so plain `localhost` reaches the
  /// dev backend directly. Guarded by `!kIsWeb` first: `defaultTargetPlatform`
  /// reflects the *device* even on web (e.g. Chrome on an Android phone), and
  /// `10.0.2.2` means nothing there.
  static String get baseUrl {
    if (_hostOverride.isNotEmpty) {
      return 'http://$_hostOverride:3000/api/v1';
    }
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      return 'http://10.0.2.2:3000/api/v1';
    }
    return 'http://localhost:3000/api/v1';
  }

  static const connectTimeout = Duration(seconds: 60);
  static const receiveTimeout = Duration(seconds: 30);
}
