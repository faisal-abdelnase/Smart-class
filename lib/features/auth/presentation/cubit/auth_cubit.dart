import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/hive_services.dart';
import '../../domain/entiyies/user.dart';
import '../../domain/usecase/forgot_password_usecase.dart';
import '../../domain/usecase/login_usecase.dart';
import '../../domain/usecase/signup_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;

  AuthCubit(
    this.loginUseCase,
    this.signupUseCase,
    this.forgotPasswordUseCase,
  ) : super(AuthInitial());

  Future<void> login(String email, String password) async {
  emit(AuthLoading());

  final result = await loginUseCase(email, password);

  result.fold(
    ifLeft: (failure) => emit(AuthError(failure.message, status: AuthStatus.login)),
    ifRight: (user) {
      HiveService.box.put('role', user.role.name);
      emit(AuthSuccess(AuthStatus.login, user: user));
    },
  );
}

  Future<void> signup(
    String name, String email, String password, String role) async {
  emit(AuthLoading());

  final result = await signupUseCase(
    name: name,
    email: email,
    password: password,
    role: role,
  );

  log("Signup result: $result"); // Log the result for debugging

  result.fold(
    ifLeft: (failure) => emit(AuthError(failure.message, status: AuthStatus.signup)),
    ifRight: (user) {
      HiveService.box.put('role', user.role.name);
      log("User role saved: ${user.role.name}"); // Log the saved role for debugging

      emit(AuthSuccess(AuthStatus.signup, user: user));
      log("Signup successful, emitted AuthSuccess"); // Log success for debugging
    },
  );
}

  Future<void> forgotPassword(String email) async {
  emit(AuthLoading());

  final result = await forgotPasswordUseCase(email);

  result.fold(
    ifLeft: (failure) => emit(AuthError(failure.message, status: AuthStatus.forgot)),
    ifRight: (_) => emit(AuthSuccess(AuthStatus.forgot)),
  );
}
}
