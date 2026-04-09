import 'package:firebase_auth/firebase_auth.dart';
import 'failures.dart';

class ErrorMapper {
  static Failure mapFirebaseAuthError(FirebaseAuthException e) {
    switch (e.code) {
      case 'user-not-found':
        return const AuthFailure("User not found");
      case 'wrong-password':
        return const AuthFailure("Wrong password");
      case 'email-already-in-use':
        return const AuthFailure("Email already exists");
      case 'invalid-email':
        return const AuthFailure("Invalid email");
      case 'weak-password':
        return const AuthFailure("Weak password");

      case 'email-not-verified':
        return const AuthFailure("Please verify your email first");
      default:
        return const AuthFailure("Authentication error");
    }
  }

  static Failure mapException(Exception e) {
    return ServerFailure(e.toString());
  }
}