import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/responsive/responsive_padding.dart';
import '../../../../core/responsive/responsive_text.dart';
import '../../../../core/theme/app_dimension.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/constants.dart';
import '../view_models/role_model.dart';
import 'app_bar_rich_text.dart';
import 'role_card.dart';

Widget  buildMobile(BuildContext context, AppResponsive r) {
    return Scaffold(
    appBar: AppBar(
      title:  AppBarRichText(),
    ),

    body: AppScreenPadding(
      child: Center(
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
              baseFontSize: r.h1Size,
              style: Theme.of(context).textTheme.headlineLarge,
            ),

            SizedBox(height: r.sp(AppDimensions.sp2)),
            AppText(
              AppLocalizations.of(context)!.translate(
                  "Connecting instructors, students & parents."),
              baseFontSize: r.bodySize,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
      
            SizedBox(height: r.sp(AppDimensions.sp4)),

            AppText(
              AppLocalizations.of(context)!.translate("SIGN IN AS"),
              baseFontSize: r.captionSize,
              style: AppTypography.monoMicro,
            ),
            
            SizedBox(height: r.sp(AppDimensions.sp4)),
      
      
            RoleCard(role: RoleModel.roles[0]),
            RoleCard(role: RoleModel.roles[1]),
            RoleCard(role: RoleModel.roles[2]),
          ],
        ),
      ),
    ),
  );
  }