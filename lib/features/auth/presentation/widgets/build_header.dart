import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import 'build_theme_toggle.dart';

Widget buildHeader(AppThemeColors t, BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.school, color: AppColors.primary),
        const SizedBox(width: 8),
        Text(
          'EduConnect',
          style: AppTypography.h3.copyWith(
            color: AppColors.primary,
          ),
        ),
        const Spacer(),
        buildThemeToggle(t, context),
      ],
    );
  }