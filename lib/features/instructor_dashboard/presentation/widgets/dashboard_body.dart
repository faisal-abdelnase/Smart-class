import 'package:flutter/material.dart';
import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/theme/app_dimension.dart';
import 'posts_section.dart';
import 'schedule_section.dart';
import 'stats_section.dart';
import 'user_info_tile.dart';


class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);

    if (r.isDesktop) {
      return Padding(
        padding: r.screenPadding,
        child: Row(
          children: const [
            Expanded(flex: 2, child: _LeftSide()),
            SizedBox(width: 20),
            Expanded(child: ScheduleSection()),
          ],
        ),
      );
    }

    return SingleChildScrollView(
      padding: r.screenPadding,
      child:  Column(
        children: [
          SizedBox(height: AppDimensions.sp4),
          UserInfoTile(),
          SizedBox(height: AppDimensions.sp4),
          StatsSection(),
          SizedBox(height: AppDimensions.sp4),
          PostsSection(),
          SizedBox(height: AppDimensions.sp4),
          ScheduleSection(),
        ],
      ),
    );
  }
}

class _LeftSide extends StatelessWidget {
  const _LeftSide();

  @override
  Widget build(BuildContext context) {
    return Column(
      children:  [
        SizedBox(height: AppDimensions.sp4),
        UserInfoTile(),
        SizedBox(height: AppDimensions.sp4),
        StatsSection(),
        SizedBox(height: AppDimensions.sp4),
        PostsSection(),
      ],
    );
  }
}

