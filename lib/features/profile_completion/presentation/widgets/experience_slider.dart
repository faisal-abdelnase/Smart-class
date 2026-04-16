import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class ExperienceSlider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const ExperienceSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
      final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
      final titleColor = isDarkMode ? AppColors.darkText1 : AppColors.lightText1;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Years of Experience", style: AppTypography.labelLarge.copyWith(color: titleColor)),
            Text("${value == 20 ? '20+' : '${value.round()}'} years", style: AppTypography.labelLarge.copyWith(color: AppColors.primary)),
          ],
        ),
        Slider(
          value: value,
          min: 0,
          max: 20,
          onChanged: onChanged,
        ),
      ],
    );
  }
}