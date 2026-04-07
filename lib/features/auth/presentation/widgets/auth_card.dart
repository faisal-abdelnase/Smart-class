
import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/theme/app_dimension.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme_extensions.dart';

import 'build_header.dart';

class AuthCard extends StatelessWidget {
  final AppThemeColors t;
  final AppResponsive r;
  final AppLocalizations? l10n;
  final bool isDark;

  final String title;
  final String subtitle;

  final Widget formFields;
  final Widget actionButton;
  final Widget bottomRow;

  const AuthCard({
    super.key,
    required this.t,
    required this.r,
    required this.l10n,
    required this.isDark,
    required this.title,
    required this.subtitle,
    required this.formFields,
    required this.actionButton,
    required this.bottomRow,
  });

  @override
  Widget build(BuildContext context) {
    final sp = r.hPadding;

    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 700),
        decoration: BoxDecoration(
          color: isDark ? t.surface.withValues(alpha: 0.9) : t.surface,
          borderRadius: AppDimensions.radius2XL,
          border: Border.all(color: t.border),
          boxShadow: isDark
              ? [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: .3),
                    blurRadius: 40,
                    offset: const Offset(0, 12),
                  ),
                ]
              : [],
        ),
        padding: EdgeInsets.all(sp + 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(t, context),

            SizedBox(height: sp),

            Text(
              l10n?.translate(title) ?? title,
              style: AppTypography.displaySmall.copyWith(color: t.text1),
            ),

            const SizedBox(height: 8),

            Text(
              l10n?.translate(subtitle) ?? subtitle,
              style: AppTypography.bodyMedium.copyWith(color: t.text3),
            ),

            SizedBox(height: sp),

            formFields,

            SizedBox(height: sp),

            actionButton,

            SizedBox(height: sp),

            bottomRow,
          ],
        ),
      ),
    );
  }
}