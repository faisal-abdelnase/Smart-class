import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_dimension.dart';
import '../../../../core/theme/app_text_styles.dart';

class UserInfoTile extends StatelessWidget {
  const UserInfoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
        spacing: AppDimensions.sp3,
        children: [
          CircleAvatar(
            radius: AppDimensions.avatarXS,
            backgroundColor: AppColors.primary,
            child: Text("FA", style: AppTypography.h4.copyWith(color: Colors.white),)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              Text("Faisal Ali", style: AppTypography.h3.copyWith(color: Colors.black)),
              SizedBox(height: 4),
              Text("Instructor", style: AppTypography.bodySmall.copyWith(color: Colors.blue)),
            ],
          ),
          
        ],
      );
  }
}