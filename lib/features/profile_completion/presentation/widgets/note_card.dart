import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final containerBg = isDarkMode ? AppColors.darkBorder.withValues(alpha: 0.3) : AppColors.primary.withValues(alpha: 0.1);
    final textColor = isDarkMode ? AppColors.darkText2 : AppColors.primary;
    final iconColor = AppColors.purple;
    
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: containerBg,
      ),
      child: Row(
        children: [
          Icon(Icons.verified, color: iconColor),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              "Instructor Verification\nYou'll be asked to provide credentials in step 3.",
              style: AppTypography.bodyMedium.copyWith(color: textColor),
            ),
          )
        ],
      ),
    );
  }
}