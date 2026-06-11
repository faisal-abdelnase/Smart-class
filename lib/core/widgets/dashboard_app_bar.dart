import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import 'package:smart_class/core/routing/routes.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';
import 'package:smart_class/core/utils/extensions.dart';
import 'package:smart_class/core/widgets/app_bar_rich_text.dart';
import 'package:smart_class/core/widgets/build_local_lang.dart';

import '../../features/search/presentation/widgets/search_text_field.dart';
import '../theme/app_colors.dart';
import '../theme/app_theme_extensions.dart';
import 'build_theme_toggle.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);
    final t = Theme.of(context).extension<AppThemeColors>()!;
    return AppBar(
      automaticallyImplyLeading: false,
      title: AppBarRichText(),
      actions: [

        buildThemeToggle(t,context),
        buildLocalLang(context),

        if(r.isMobile || r.isTablet)
            IconButton(
              onPressed: (){
                context.pushNamed(Routes.searchPage);
              }, 
              icon: Icon(Icons.search, color: AppColors.primary,)),

        if(r.isDesktop)
            SearchTextField(),
        
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