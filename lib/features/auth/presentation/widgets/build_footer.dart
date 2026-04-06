import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_theme_extensions.dart';

Widget buildFooter(AppThemeColors t, AppLocalizations? l10n) {
    return Positioned(
      bottom: 16,
      left: 0,
      right: 0,
      child: Center(
        child: Text(
          'EDUCONNECT • 2024',
          style: TextStyle(color: t.text4),
        ),
      ),
    );
  }