
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/services/firebase_auth_service.dart';
import '../../domain/entiyies/user_role.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login(String email, String password);
  Future<UserModel> signup(
      String name, String email, String password, String role);
  Future<void> forgotPassword(String email);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseService firebaseService;

  AuthRemoteDataSourceImpl(this.firebaseService);

  @override
  Future<UserModel> login(String email, String password) async {

    
    final credential = await firebaseService.signIn(email, password);

    final user = credential.user;

  if (!user!.emailVerified) {
    throw FirebaseAuthException(
      code: 'email-not-verified',
      message: 'Please verify your email',
    );
  }

    final doc =
        await firebaseService.getUserData(credential.user!.uid);

    return UserModel.fromJson(doc, credential.user!.uid);
  }

  @override
  Future<UserModel> signup(
      String name, String email, String password, String role) async {
    final credential = await firebaseService.signUp(email, password);

    await firebaseService.sendEmailVerification();

    await firebaseService.saveUserData(
      uid: credential.user!.uid,
      name: name,
      email: email,
      role: role,
    );

    return UserModel(
      id: credential.user!.uid,
      name: name,
      email: email,
      role: UserRoleX.fromName(role),
    );
  }

  @override
  Future<void> forgotPassword(String email) async {
    await firebaseService.resetPassword(email);
  }
}
