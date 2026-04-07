import 'package:flutter/material.dart';
import 'package:smart_class/core/utils/extensions.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theme/app_theme_extensions.dart';

Widget buildAuthRow(
  AppThemeColors t,
  AppLocalizations? l10n,
  BuildContext context,
  String text,
  String route,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        l10n!.translate(text),
        style: TextStyle(color: t.text2),
      ),
      TextButton(
        onPressed: () {
          context.pushNamed(route);
        },
        child: Text(
          route == Routes.loginPage
              ? l10n.translate("login")
              : l10n.translate("sign_up"),
        ),
      )
    ],
  );
}