import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../core/utils/validators.dart';
import 'auth_text_filed.dart';

Widget buildSignUpFormFields(
  AppLocalizations? l10n, 
  TextEditingController nameController, 
  TextEditingController emailController, 
  TextEditingController passwordController,
  BuildContext context,) {
    return Column(
      children: [
        AuthTextField(
          l10n: l10n!,
          hint: "John Doe",
          label: "full_name",
          controller: nameController,
          prefixIcon: Icons.person_outline,
          validator: Validators.name,
        ),
        const SizedBox(height: 12),
        AuthTextField(
          l10n: l10n,
          hint: "john.doe@example.com",
          label: "email_address",
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icons.email_outlined,
          validator: Validators.email,
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
          validator: Validators.password,
        ),

        const SizedBox(height: 12),

      Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {
            context.pushNamedAndRemoveUntil(Routes.roleSelectionPage, predicate: (route) => false,);
          },
          child: Text(l10n.translate("slect_role_instead")),
        ),
      ),
      ],
    );
  }