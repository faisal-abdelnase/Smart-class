import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/responsive_padding.dart';
import 'package:smart_class/core/theme/app_colors.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final bool? isCardStudent;

  const StatCard({
    super.key,
    required this.title,
    required this.value,
    this.isCardStudent,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = theme.extension<AppThemeColors>()!;
    final isStudent = isCardStudent == true;

    return Container(
      decoration: BoxDecoration(
        gradient: isStudent ? AppColors.gradientPrimary2 : null,
        color: isStudent ? null : t.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: t.border),
      ),
      child: AppScreenPadding(
        vertical: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTypography.bodySmall.copyWith(
                color: isStudent ? Colors.white : t.text2,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              value,
              style: AppTypography.h1.copyWith(
                color: isStudent ? Colors.white : t.text1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}