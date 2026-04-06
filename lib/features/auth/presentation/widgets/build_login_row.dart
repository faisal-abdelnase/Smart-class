import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_theme_extensions.dart';

Widget buildLoginRow(AppThemeColors t, AppLocalizations? l10n) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account?',
          style: TextStyle(color: t.text2),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Login'),
        )
      ],
    );
  }