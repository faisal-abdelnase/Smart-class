import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

Widget buildBackground(bool isDark) {
    if (!isDark) {
      return Container(color: AppColors.lightBg);
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0D0F1A), Color(0xFF13152B)],
        ),
      ),
    );
  }