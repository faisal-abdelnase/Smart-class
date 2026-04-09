import 'package:dart_either/dart_either.dart';
import '../../../../core/errors/failures.dart';
import '../entiyies/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);

  Future<Either<Failure, User>> signup({
    required String name,
    required String email,
    required String password,
    required String role,
  });

  Future<Either<Failure, void>> forgotPassword(String email);
}