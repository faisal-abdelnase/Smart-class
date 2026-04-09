part of 'auth_cubit.dart';

enum AuthStatus { login, signup, forgot }

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final AuthStatus status;
  AuthSuccess(this.status);
}

final class AuthError extends AuthState {
  final AuthStatus status;
  final String message;
  AuthError(this.message, {required this.status});
}