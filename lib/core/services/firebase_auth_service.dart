import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  FirebaseService(this._auth, this._firestore);

  // ================= AUTH =================

  Future<UserCredential> signUp(String email, String password) {
    return _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<UserCredential> signIn(String email, String password) {
    return _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> resetPassword(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  Future<void> logout() {
    return _auth.signOut();
  }

  Future<void> sendEmailVerification() async {
  await _auth.currentUser?.sendEmailVerification();
}

Future<bool> isEmailVerified() async {
  await _auth.currentUser?.reload();
  return _auth.currentUser?.emailVerified ?? false;
}

  User? get currentUser => _auth.currentUser;

  // ================= FIRESTORE =================

  Future<void> saveUserData({
    required String uid,
    required String name,
    required String email,
    required String role,
  }) async {
    await _firestore.collection('users').doc(uid).set({
      'name': name,
      'email': email,
      'role': role,
    });
  }

  Future<Map<String, dynamic>> getUserData(String uid) async {
    final doc = await _firestore.collection('users').doc(uid).get();
    return doc.data()!;
  }
}