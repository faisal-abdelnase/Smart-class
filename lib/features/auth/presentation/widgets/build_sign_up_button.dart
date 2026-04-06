import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/app_responsive.dart';

Widget buildSignUpButton(AppLocalizations? l10n, AppResponsive r, bool isLoading, VoidCallback handleSignup) {
    return SizedBox(
      width: double.infinity,
      height: r.sp(48),
      child: ElevatedButton(
        onPressed: isLoading ? null : handleSignup,
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Text(l10n?.translate('sign_up') ?? 'Sign Up'),
      ),
    );
  }