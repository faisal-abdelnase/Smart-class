import 'package:flutter/material.dart';

import '../../../../core/responsive/responsive_text.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme_extensions.dart';

class DashboardCard extends StatelessWidget {
  final String title;
  final Widget child;

  const DashboardCard({super.key, 
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).extension<AppThemeColors>()!;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: t.surface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: t.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          AppText(title, baseFontSize: 20 , style: AppTypography.h1.copyWith(color: t.text1)),
          

          const SizedBox(height: 22),

          child,
        ],
      ),
    );
  }
}