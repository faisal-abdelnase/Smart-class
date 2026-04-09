import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/firebase_auth_service.dart';

class VerifyEmailCubit extends Cubit<bool> {
  final FirebaseService firebaseService;

  VerifyEmailCubit(this.firebaseService) : super(false);

  Future<void> checkVerification() async {
    final isVerified = await firebaseService.isEmailVerified();
    emit(isVerified);
  }

  Future<void> resendEmail() async {
    await firebaseService.sendEmailVerification();
  }
}