import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_dimension.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';

import '../../../../core/theme/app_colors.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Let's set up your profile",
          style: AppTypography.h1.copyWith(color: isDarkMode ? AppColors.darkText1 : AppColors.lightText1),
        ),
        SizedBox(height: AppDimensions.sp2),
        Text(
          "Tell us a bit about yourself so we can personalize your experience as an instructor.",
          style: AppTypography.bodyMedium.copyWith(color: isDarkMode ? AppColors.darkText3 : AppColors.lightText3),
        ),
      ],
    );
  }
}