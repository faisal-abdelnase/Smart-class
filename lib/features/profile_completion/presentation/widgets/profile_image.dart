import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_dimension.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme_extensions.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final t = Theme.of(context).extension<AppThemeColors>()!;

    final iconColor = isDarkMode ? AppColors.lightText4 : AppColors.darkText4;
    final badgeColor = Theme.of(context).colorScheme.primary;

    return Center(
      child: Column(
        children: [

          Text("Upload Photo", 
          style: Theme.of(context).textTheme.labelLarge!.copyWith(
            color: isDarkMode ? AppColors.darkText1 : AppColors.lightText1)),

          SizedBox(height: AppDimensions.sp2),
          Stack(
            children: [
              CircleAvatar(
                radius: AppDimensions.avatarXL,
                backgroundColor: t.surface,
                child: Icon(Icons.camera_alt, color: iconColor),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: AppDimensions.avatarS,
                  backgroundColor: badgeColor,
                  child: Icon(Icons.edit, size: 16, color: t.textInverse),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}