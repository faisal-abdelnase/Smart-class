import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/theme/app_dimension.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import 'build_form_field.dart';
import 'build_header.dart';
import 'build_login_row.dart';
import 'build_sign_up_button.dart';

Widget buildCard(
    AppThemeColors t,
    AppResponsive r,
    AppLocalizations? l10n,
    bool isDark,
    TextEditingController nameController,
    TextEditingController emailController,
    TextEditingController passwordController,
    bool isLoading,
    VoidCallback handleSignup,
    BuildContext context
  ) {
    final sp = r.hPadding; 

    return Center(
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 700,
        ),
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
              l10n?.translate('create_account') ?? 'Create Account',
              style: AppTypography.displaySmall.copyWith(
                color: t.text1,
              ),
            ),
      
            const SizedBox(height: 8),
      
            Text(
              l10n?.translate('join_community') ??
                  'Join our community of learners',
              style: AppTypography.bodyMedium.copyWith(color: t.text3),
            ),

    
      
            SizedBox(height: sp),
      
            buildFormFields(l10n, nameController, emailController, passwordController),
      
            SizedBox(height: sp),
      
            buildSignUpButton(l10n, r, isLoading, handleSignup),
      
            SizedBox(height: sp),
      
            buildLoginRow(t, l10n),
          ],
        ),
      ),
    );
  }