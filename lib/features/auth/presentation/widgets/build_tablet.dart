import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/responsive_padding.dart';
import 'package:smart_class/core/theme/app_colors.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/responsive/responsive_text.dart';
import '../../../../core/theme/app_dimension.dart';
import '../../../../core/utils/constants.dart';
import '../view_models/role_model.dart';
import 'role_card.dart';

Widget  buildTablet(BuildContext context, AppResponsive r){

  return Scaffold(
    body: Row(
      children: [
        Container(
          color: AppColors.primary,
          width: r.screenWidth * 0.5,
          height: r.screenHeight,
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
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: Colors.white),
                  ),
            
                  SizedBox(height: r.sp(AppDimensions.sp2)),
                  AppText(
                    AppLocalizations.of(context)!.translate(
                        "The smart educational platform\n connecting everyone."),
                    textAlign: TextAlign.center,
                    baseFontSize: r.bodySize,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white70),
                  ),
              ],
            ),
        )
        ),


        Expanded(
          child: AppScreenPadding(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  AppLocalizations.of(context)!.translate("SIGN IN AS"),
                  baseFontSize: r.captionSize,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                
                SizedBox(height: r.sp(AppDimensions.sp4)),
                  
                  
                RoleCard(role: RoleModel.roles[0]),
                RoleCard(role: RoleModel.roles[1]),
                RoleCard(role: RoleModel.roles[2]),
              ],
            ),
          ),
        )
      ],
    ),
  );
}