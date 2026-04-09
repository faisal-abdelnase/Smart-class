import 'package:dart_either/dart_either.dart';

import '../../../../core/errors/failures.dart';
import '../entiyies/user.dart';
import '../repositories/auth_repository.dart';

class SignupUseCase {
  final AuthRepository repository;

  SignupUseCase(this.repository);

  Future<Either<Failure, User>> call({
    required String name,
    required String email,
    required String password,
    required String role,
  }) {
    return repository.signup(
      name: name,
      email: email,
      password: password,
      role: role,
    );
  }
}