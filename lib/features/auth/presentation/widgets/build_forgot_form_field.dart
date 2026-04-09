import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/utils/validators.dart';
import 'auth_text_filed.dart';

Widget buildForgotFormField(
  AppLocalizations? l10n,
  TextEditingController emailController,
) {
  return AuthTextField(
    l10n: l10n!,
    hint: "name@university.edu",
    label: "email_address",
    controller: emailController,
    keyboardType: TextInputType.emailAddress,
    prefixIcon: Icons.email_outlined,
    validator:  Validators.email,
  );
}