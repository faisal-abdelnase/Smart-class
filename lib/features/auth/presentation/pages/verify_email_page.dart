import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_class/core/utils/extensions.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/auth_dialogs.dart';
import '../cubit/verify_email_cubit.dart';

class VerifyEmailPage extends StatefulWidget {
  const VerifyEmailPage({super.key});

  @override
  State<VerifyEmailPage> createState() => _VerifyEmailPageState();
}

class _VerifyEmailPageState extends State<VerifyEmailPage> {
  Timer? timer;
  Timer? checkTimer;
  int seconds = 60;

  @override
  void initState() {
    super.initState();

    startTimer();
    startAutoCheck();
  }

  void startTimer() {
    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
      } else {
        setState(() => seconds--);
      }
    });
  }

  void startAutoCheck() {
    checkTimer?.cancel();
    checkTimer = Timer.periodic(const Duration(seconds: 3), (t) async {
      if (!mounted) {
        t.cancel();
        return;
      }

      final isVerified = await context
          .read<VerifyEmailCubit>()
          .firebaseService
          .isEmailVerified();

      if (isVerified) {
        t.cancel();
        if (mounted) {
          final l10n = AppLocalizations.of(context);
          showSuccessSnackBar(context, l10n?.translate("Email verified successfully") ?? "Email verified successfully");
          context.pushReplacementNamed(Routes.loginPage);
        }
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    checkTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.email, size: 80),

            const SizedBox(height: 20),

            const Text(
              "Verify your email",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            const Text("Check your inbox and click the link"),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: seconds == 0
                  ? () {
                      context.read<VerifyEmailCubit>().resendEmail();
                      setState(() => seconds = 60);
                      startTimer();
                    }
                  : null,
              child: Text(
                seconds == 0
                    ? "Resend Email"
                    : "Resend in $seconds s",
              ),
            ),
          ],
        ),
      ),
    );
  }
}