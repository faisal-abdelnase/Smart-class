import 'package:dart_either/dart_either.dart' hide ErrorMapper;
import 'package:firebase_auth/firebase_auth.dart' hide User;

import '../../../../core/errors/error_mapper.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entiyies/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> login(
      String email, String password) async {
    try {
      final result = await remoteDataSource.login(email, password);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(ErrorMapper.mapFirebaseAuthError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> signup({
    required String name,
    required String email,
    required String password,
    required String role,
  }) async {
    try {
      final result =
          await remoteDataSource.signup(name, email, password, role);
      return Right(result);
    } on FirebaseAuthException catch (e) {
      return Left(ErrorMapper.mapFirebaseAuthError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword(String email) async {
    try {
      await remoteDataSource.forgotPassword(email);
      return const Right(null);
    } on FirebaseAuthException catch (e) {
      return Left(ErrorMapper.mapFirebaseAuthError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}