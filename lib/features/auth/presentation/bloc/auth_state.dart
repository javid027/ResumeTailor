import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/models/auth_user.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  const factory AuthState.initial() = AuthInitial;

  /// Only the initial session-check on app boot — the router treats this
  /// (and [AuthState.initial]) as "force the splash route". Login/register
  /// in flight use [AuthState.submitting] instead, precisely so they don't
  /// trigger that redirect and blow away the form the user is looking at.
  const factory AuthState.loading() = AuthLoading;

  /// A login/register request is in flight. Deliberately distinct from
  /// [AuthState.loading] — see that variant's doc comment.
  const factory AuthState.submitting() = AuthSubmitting;

  /// [user] is null after a silent session restore (`GET /auth/refresh`
  /// returns only a token pair, never the user) — only login/register
  /// populate it.
  const factory AuthState.authenticated({AuthUser? user}) = AuthAuthenticated;

  const factory AuthState.unauthenticated() = AuthUnauthenticated;

  const factory AuthState.failure({required String code, required String message}) = AuthFailure;
}
