import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';
import 'package:smart_class/core/utils/extensions.dart';
import '../../data/models/group_model.dart';
import '../widgets/group_details_header.dart';
import '../widgets/group_details_panel.dart';

class GroupDetailsPage extends StatelessWidget {
  const GroupDetailsPage({super.key, this.group});

  final GroupModel? group;

  @override
  Widget build(BuildContext context) {
    final responsive = AppResponsive.of(context);
    final tokens = Theme.of(context).extension<AppThemeColors>()!;
    final title = group?.name ?? context.tr('group_alpha_math');
    final memberCount = group?.studentCount ?? 28;
    final horizontalPadding = responsive.sp(
      responsive.isMobile
          ? 12
          : responsive.isTablet
          ? 20
          : 28,
    );

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: tokens.bg,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              horizontalPadding,
              responsive.sp(20),
              horizontalPadding,
              0,
            ),
            child: Column(
              children: <Widget>[
                GroupDetailsHeader(
                  title: title,
                  memberCount: memberCount,
                  compact: responsive.isMobile,
                ),
                SizedBox(height: responsive.sp(18)),
                Expanded(
                  child: GroupDetailsPanel(
                    memberCount: memberCount,
                    compact: responsive.isMobile,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}







