import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/responsive_padding.dart';
import 'package:smart_class/core/responsive/responsive_text.dart';
import 'package:smart_class/core/theme/app_dimension.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';
import 'package:smart_class/features/search/presentation/widgets/search_text_field.dart';
import 'package:smart_class/features/search/presentation/widgets/select_buttons_filter.dart';
import 'package:smart_class/features/search/presentation/widgets/suggested_users_section.dart';

import '../../../../core/utils/extensions.dart';
import '../widgets/groups_section.dart';
import '../widgets/recent_search_section.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).extension<AppThemeColors>()!;
    return Scaffold(
      body: SafeArea(
        child: AppScreenPadding(
          vertical: true,
          child: SingleChildScrollView(
            child: Column(
              
              spacing: AppDimensions.sp4,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            
                Align(
                  alignment: Alignment.topCenter,
                  child: SearchTextField(width: 400, hintText: context.tr("search_hint"))),
                SelectButtonsFilter(),

                AppText(context.tr("recent_search"), baseFontSize: 14, style: AppTypography.h1.copyWith(color: t.text1), ),
            
                RecentSearchSection(),
            
                AppText(context.tr("suggested_users"), baseFontSize: 14, style: AppTypography.h1.copyWith(color: t.text1), ),
            
                SuggestedUsersSection(),
            
                AppText(context.tr("suggested_groups"), baseFontSize: 14, style: AppTypography.h1.copyWith(color: t.text1), ),
                GroupsSection(),
              ],
            ),
          ),
        ),
        )
    );
  }
}

