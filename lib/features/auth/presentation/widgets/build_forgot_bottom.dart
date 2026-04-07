import 'package:flutter/material.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/localization/app_localizations.dart';

Widget buildForgotBottom(AppThemeColors t, AppLocalizations? l10n) {
  return Column(
    children: [
      const Divider(),
      const SizedBox(height: 12),
    

      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            l10n!.translate("no_access"),
            style: TextStyle(color: t.text2),
          ),
          TextButton(
            onPressed: () {
              
            },
            child: Text(
              l10n.translate("contact_support"),
            ),
          )
        ],
      )
    ],
  );
}