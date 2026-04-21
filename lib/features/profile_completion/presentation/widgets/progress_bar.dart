import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_dimension.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ProgressBar  extends StatelessWidget {
  const ProgressBar ({
    super.key,
    required this.progress,
    required this.step,
    required this.stepTitle,
  });

  final double progress;
  final int step;
  final String stepTitle;


  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    final titleColor = isDarkMode ? AppColors.darkText1 : AppColors.lightText1;
    final progressBgColor = isDarkMode ? AppColors.darkBorder : AppColors.lightText4;
    final captionColor = isDarkMode ? AppColors.darkText3 : AppColors.lightText3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(stepTitle, style: AppTypography.labelLarge.copyWith(color: titleColor)),
        const SizedBox(height: AppDimensions.sp2),
        LinearProgressIndicator(
          value: progress,
          backgroundColor: progressBgColor,
          color: AppColors.primary,
        ),
        const SizedBox(height: AppDimensions.sp1),
        Align(
          alignment: Alignment.centerRight,
          child: Text("Step ${step + 1} of 3", style: AppTypography.labelMedium.copyWith(color: captionColor)),
        )
      ],
    );
  }
}
