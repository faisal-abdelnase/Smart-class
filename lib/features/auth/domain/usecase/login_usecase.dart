import 'package:dart_either/dart_either.dart';
import '../../../../core/errors/failures.dart';
import '../entiyies/user.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, User>> call(
      String email, String password) {
    return repository.login(email, password);
  }
}