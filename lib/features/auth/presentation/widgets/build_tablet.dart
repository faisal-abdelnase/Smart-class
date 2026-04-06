import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/responsive_padding.dart';
import 'package:smart_class/core/theme/app_colors.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/responsive/responsive_text.dart';
import '../../../../core/theme/app_dimension.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/utils/constants.dart';
import '../view_models/role_model.dart';
import 'build_local_lang.dart';
import 'build_theme_toggle.dart';
import 'role_card.dart';

Widget buildTablet(BuildContext context, AppResponsive r) {
  final isDark = Theme.of(context).brightness == Brightness.dark;
  final t = Theme.of(context).extension<AppThemeColors>()!;

  return Scaffold(
    body: Row(
      children: [
        /// 🔵 Left Side
        Container(
          width: r.screenWidth * 0.5,
          height: r.screenHeight,
          decoration: BoxDecoration(
            gradient: isDark
                ? AppColors.gradientDarkAI
                : AppColors.gradientPrimary,
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Constants.logo, scale: 7),

                AppText(
                  AppLocalizations.of(context)!
                      .translate("Welcome to EduConnect"),
                  baseFontSize: r.h1Size,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(color: Colors.white),
                ),

                SizedBox(height: r.sp(AppDimensions.sp2)),

                AppText(
                  AppLocalizations.of(context)!.translate(
                      "The smart educational platform\n connecting everyone."),
                  textAlign: TextAlign.center,
                  baseFontSize: r.bodySize,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.white70),
                ),
              ],
            ),
          ),
        ),

        /// ⚪ Right Side
        Expanded(
          child: AppScreenPadding(
            child: Column(
              children: [
              
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildThemeToggle(t, context),

                      const SizedBox(width: 16),

                      buildLocalLang(context),
                    ],
                  ),
                ),

                
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        AppLocalizations.of(context)!
                            .translate("SIGN IN AS"),
                        baseFontSize: r.captionSize,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium!
                            .copyWith(
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
              ],
            ),
          ),
        ),
      ],
    ),
  );
}