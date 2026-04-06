import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import 'auth_text_filed.dart';

Widget buildFormFields(AppLocalizations? l10n, TextEditingController nameController, TextEditingController emailController, TextEditingController passwordController) {
    return Column(
      children: [
        AuthTextField(
          hint: "John Doe",
          label: 'Full Name',
          controller: nameController,
          prefixIcon: Icons.person_outline,
        ),
        const SizedBox(height: 12),
        AuthTextField(
          hint: "john.doe@example.com",
          label: 'Email',
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icons.email_outlined,
        ),
        const SizedBox(height: 12),
        AuthTextField(
          hint: "••••••••",
          label: 'Password',
          controller: passwordController,
          obscureText: true,
          prefixIcon: Icons.lock_outline,
          showToggle: true,
        ),
      ],
    );
  }