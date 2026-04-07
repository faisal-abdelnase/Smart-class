import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import 'auth_text_filed.dart';

Widget buildSignUpFormFields(AppLocalizations? l10n, TextEditingController nameController, TextEditingController emailController, TextEditingController passwordController) {
    return Column(
      children: [
        AuthTextField(
          l10n: l10n!,
          hint: "John Doe",
          label: "full_name",
          controller: nameController,
          prefixIcon: Icons.person_outline,
        ),
        const SizedBox(height: 12),
        AuthTextField(
          l10n: l10n,
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
      ],
    );
  }