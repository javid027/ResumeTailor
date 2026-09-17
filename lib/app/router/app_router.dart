import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
import '../../features/auth/presentation/view/login_page.dart';
import '../../features/auth/presentation/view/register_page.dart';
import '../../features/auth/presentation/view/splash_page.dart';
import '../../features/history/presentation/view/history_page.dart';
import '../../features/job_description/presentation/view/job_description_page.dart';
import '../../features/profile/presentation/view/profile_page.dart';
import '../../features/resume_upload/presentation/view/upload_page.dart';
import '../../features/tailoring/presentation/view/tailoring_result_page.dart';
import 'app_routes.dart';
import 'app_shell.dart';
import 'go_router_refresh_stream.dart';

@module
abstract class RouterModule {
  @lazySingleton
  GoRouter router(AuthBloc authBloc) => GoRouter(
        initialLocation: AppRoute.splash.path,
        refreshListenable: GoRouterRefreshStream(authBloc.stream),
        redirect: (context, state) {
          final path = state.matchedLocation;
          final isAuthRoute = path == AppRoute.login.path || path == AppRoute.register.path;
          final isSplash = path == AppRoute.splash.path;

          return switch (authBloc.state) {
            AuthInitial() || AuthLoading() => isSplash ? null : AppRoute.splash.path,
            // A login/register submission in flight must never force-navigate
            // away from the form it belongs to — that's the whole reason this
            // is a separate state from AuthLoading (see its doc comment).
            AuthSubmitting() => null,
            AuthAuthenticated() => (isSplash || isAuthRoute) ? AppRoute.upload.path : null,
            AuthUnauthenticated() => isAuthRoute ? null : AppRoute.login.path,
            AuthFailure() => isAuthRoute ? null : AppRoute.login.path,
          };
        },
        routes: [
          GoRoute(
            path: AppRoute.splash.path,
            builder: (context, state) => const SplashPage(),
          ),
          GoRoute(
            path: AppRoute.login.path,
            builder: (context, state) => const LoginPage(),
          ),
          GoRoute(
            path: AppRoute.register.path,
            builder: (context, state) => const RegisterPage(),
          ),
          GoRoute(
            path: AppRoute.jobDescription.path,
            builder: (context, state) => JobDescriptionPage(resumeId: state.extra as String?),
          ),
          GoRoute(
            path: AppRoute.tailoring.path,
            builder: (context, state) => TailoringResultPage(args: state.extra as TailoringPageArgs),
          ),
          StatefulShellRoute.indexedStack(
            builder: (context, state, navigationShell) =>
                AppShell(navigationShell: navigationShell),
            branches: [
              StatefulShellBranch(routes: [
                GoRoute(
                  path: AppRoute.upload.path,
                  builder: (context, state) => const UploadPage(),
                ),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                  path: AppRoute.history.path,
                  builder: (context, state) => const HistoryPage(),
                ),
              ]),
              StatefulShellBranch(routes: [
                GoRoute(
                  path: AppRoute.profile.path,
                  builder: (context, state) => const ProfilePage(),
                ),
              ]),
            ],
          ),
        ],
      );
}
