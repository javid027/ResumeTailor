import 'dart:async';

import 'package:flutter/foundation.dart';

/// Adapts a [Stream] (here, an `AuthBloc`'s state stream) into the
/// [Listenable] go_router's `refreshListenable` expects, so the router
/// re-evaluates its redirect whenever auth state changes.
class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<dynamic> stream) {
    _subscription = stream.asBroadcastStream().listen((_) => notifyListeners());
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
