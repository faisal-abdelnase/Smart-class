import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_colors.dart';
import '../../../../core/localization/app_localizations.dart';
import '../../../../core/theme/app_dimension.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/constants.dart';
import '../view_models/role_model.dart';
import '../widgets/app_bar_rich_text.dart';
import '../widgets/role_card.dart';

class RoleSelectionPage extends StatelessWidget {
  const RoleSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title:  AppBarRichText(),
      ),

      body: Padding(
        padding: AppDimensions.screenPadding,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Constants.logo,
                scale: 7,
              ),
        
              Text(AppLocalizations.of(context)!.translate("Welcome to EduConnect"), style: Theme.of(context).textTheme.headlineLarge,),
              SizedBox(height: AppDimensions.sp2,),
              Text(AppLocalizations.of(context)!.translate("Connecting instructors, students & parents."), style: Theme.of(context).textTheme.bodyMedium,),
        
              SizedBox(height: AppDimensions.sp4,),
              Text(AppLocalizations.of(context)!.translate("SIGN IN AS"), style: AppTypography.monoMicro),
              SizedBox(height: AppDimensions.sp4,),
        
        
              RoleCard(role: RoleModel.roles[0]),
              RoleCard(role: RoleModel.roles[1]),
              RoleCard(role: RoleModel.roles[2]),
            ],
          ),
        ),
      ),
    );
  }

}



