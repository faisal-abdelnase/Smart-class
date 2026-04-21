import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_dimension.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme_extensions.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.selectedImage,
    required this.onChanged,
  });

  final String selectedImage;
  final ValueChanged<String> onChanged;

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
                backgroundImage: selectedImage.isNotEmpty
                    ? AssetImage(selectedImage)
                    : null,
                child: selectedImage.isEmpty
                    ? Icon(Icons.camera_alt, color: iconColor)
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: AppDimensions.avatarS,
                  backgroundColor: badgeColor,
                  child: PopupMenuButton<String>(
                    padding: EdgeInsets.zero,
                    tooltip: 'Choose avatar',
                    onSelected: onChanged,
                    itemBuilder: (context) => const [
                      PopupMenuItem(value: '', child: Text('Use default')),
                      PopupMenuItem(
                        value: 'assets/images/onboarding1.png',
                        child: Text('Avatar 1'),
                      ),
                      PopupMenuItem(
                        value: 'assets/images/onboarding2.png',
                        child: Text('Avatar 2'),
                      ),
                      PopupMenuItem(
                        value: 'assets/images/onboarding3.png',
                        child: Text('Avatar 3'),
                      ),
                    ],
                    child: Icon(Icons.edit, size: 16, color: t.textInverse),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
