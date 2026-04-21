import 'package:flutter/material.dart';

import '../../../../core/theme/app_theme_extensions.dart' show AppThemeColors;

Widget buildDivider(AppThemeColors t, String label) {
    return Row(
      children: [
        Expanded(child: Divider(color: t.border)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(label, style: TextStyle(color: t.text3)),
        ),
        Expanded(child: Divider(color: t.border)),
      ],
    );
  }
