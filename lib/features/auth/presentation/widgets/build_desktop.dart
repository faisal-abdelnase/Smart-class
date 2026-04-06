import 'package:flutter/material.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/responsive/responsive_padding.dart';
import '../../../../core/responsive/responsive_text.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimension.dart';
import '../../../../core/theme/app_shadows.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/utils/constants.dart';
import '../view_models/role_model.dart';
import 'build_local_lang.dart';
import 'build_theme_toggle.dart';
import 'role_card.dart';

Widget buildDesktop(BuildContext context, AppResponsive r) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final t = Theme.of(context).extension<AppThemeColors>()!;

  return Scaffold(
    backgroundColor:
        isDark ? AppColors.darkBg : AppColors.lightBg,

    body: SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: EdgeInsets.only(bottom: r.sp(AppDimensions.sp3)),
              child: Align(
                alignment: AlignmentDirectional.topEnd,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildThemeToggle(t,context),
                    const SizedBox(width: 16),
                    buildLocalLang(context),
                  ],
                ),
              ),
            ),
      
            /// 🧠 Card
            Container(
              constraints: const BoxConstraints(
                maxWidth: 520,
                minWidth: 420,
              ),
              padding: EdgeInsets.all(r.sp(AppDimensions.sp5)),
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.darkSurface
                    : AppColors.lightSurface,
                borderRadius: AppDimensions.radiusLG,
                boxShadow: AppShadows.lg,
              ),
              child: AppScreenPadding(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Constants.logo,
                      scale: 7,
                    ),
                            
                    AppText(
                      AppLocalizations.of(context)!
                          .translate("Welcome to EduConnect"),
                      baseFontSize: r.h2Size,
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                            
                    SizedBox(height: r.sp(AppDimensions.sp2)),
                            
                    AppText(
                      AppLocalizations.of(context)!.translate(
                          "Connecting instructors, students & parents."),
                      textAlign: TextAlign.center,
                      baseFontSize: r.bodySize,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                            
                    SizedBox(height: r.sp(AppDimensions.sp4)),
                            
                    AppText(
                      AppLocalizations.of(context)!
                          .translate("SIGN IN AS"),
                      baseFontSize: r.captionSize,
                      style: AppTypography.monoMicro.copyWith(
                        color: isDark
                            ? AppColors.darkText2
                            : AppColors.lightText2,
                      ),
                    ),
                            
                    SizedBox(height: r.sp(AppDimensions.sp4)),
                            
                    RoleCard(role: RoleModel.roles[0]),
                    RoleCard(role: RoleModel.roles[1]),
                    RoleCard(role: RoleModel.roles[2]),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}