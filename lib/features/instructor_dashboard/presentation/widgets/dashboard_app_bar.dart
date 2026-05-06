import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';
import 'package:smart_class/core/widgets/app_bar_rich_text.dart';

import '../../../../core/theme/app_colors.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: AppBarRichText(),
      actions: [
        Stack(
          children: [
            IconButton(
              onPressed: () {}, 
              icon: const 
              Icon(Icons.notifications, color: AppColors.yellow,)),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                
              ),
            )
          ],
        ),
        SizedBox(width: 10),
        CircleAvatar(
          backgroundColor: AppColors.primary,
          child: Text("FA", style: AppTypography.h4.copyWith(color: Colors.white),)),
        SizedBox(width: 16),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}