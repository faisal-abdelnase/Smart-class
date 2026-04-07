import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/extensions.dart';
import 'auth_text_filed.dart';

Widget buildLoginFormFields(
  AppLocalizations? l10n,
  TextEditingController emailController,
  TextEditingController passwordController,
  BuildContext context,
) {
  return Column(
    children: [
      AuthTextField(
        l10n: l10n!,
        hint: "john.doe@example.com",
        label: "email_address",
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        prefixIcon: Icons.email_outlined,
      ),
      const SizedBox(height: 12),
      AuthTextField(
        l10n: l10n,
        hint: "••••••••",
        label: "password",
        controller: passwordController,
        obscureText: true,
        prefixIcon: Icons.lock_outline,
        showToggle: true,
      ),

      const SizedBox(height: 12),

      Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            context.pushNamed(Routes.forgotPasswordPage);
          },
          child: Text(l10n.translate("forgot_password")),
        ),
      ),
    ],
  );
}