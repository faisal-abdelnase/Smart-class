import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/responsive_padding.dart';
import 'package:smart_class/core/theme/app_colors.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';

class StatCard extends StatelessWidget {
  final String title;
  final String value;
  final bool? isCardStudent;

  const StatCard(
    {super.key, 
    required this.title, 
    required this.value,
    this.isCardStudent

    });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        gradient: isCardStudent == true && isCardStudent != null ? AppColors.gradientPrimary2 : null,
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[300]!),
        // boxShadow: AppShadows.lg
      ),
      child: AppScreenPadding(
        vertical: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AppTypography.bodySmall.copyWith(color: isCardStudent == true && isCardStudent != null ? Colors.white : Colors.grey[600], fontWeight: FontWeight.bold)),
            const Spacer(),
            Text(value, style: AppTypography.h1.copyWith(
              color: isCardStudent == true && isCardStudent != null ? Colors.white 
              : Colors.black)),
          ],
        ),
      ),
    );
  }
}