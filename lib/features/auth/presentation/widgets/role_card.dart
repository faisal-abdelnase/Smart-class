import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_shadows.dart';
import 'package:smart_class/features/auth/presentation/view_models/role_model.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/services/hive_services.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimension.dart';
import '../../../../core/theme/app_text_styles.dart';

class RoleCard extends StatelessWidget {

  final RoleModel role;
  const RoleCard({
    super.key, required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        HiveService.box.put('role', 'student');
        Navigator.pushNamed(context, Routes.loginPage);
        
      },

      child: Container(
        padding: AppDimensions.cardPadding,
        margin: EdgeInsets.symmetric(vertical: AppDimensions.sp3),
        decoration: BoxDecoration(
          color: AppColors.lightSurface,
          borderRadius: AppDimensions.radiusLG,
          border: Border.all(color: AppColors.lightBorder),
      
          boxShadow: AppShadows.card(false),
        ),
      
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
      
              decoration: BoxDecoration(
                color: role.color.withValues(alpha: 0.1),
                borderRadius: AppDimensions.radiusMD
              ),
              child: Center(child: Text(role.icon, style: AppTypography.displaySmall,))
            ),
      
            SizedBox(width: AppDimensions.sp5,),
      
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.translate(role.title), style: AppTypography.h2.copyWith(color: AppColors.lightText1),),
                  Text(AppLocalizations.of(context)!.translate(role.subtitle), style: AppTypography.bodyMedium.copyWith(color: AppColors.lightText2),),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
      ),
    );
  }
}