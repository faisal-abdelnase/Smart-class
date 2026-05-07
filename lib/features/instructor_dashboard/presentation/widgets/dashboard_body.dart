import 'package:flutter/material.dart';
import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/theme/app_dimension.dart';
import 'recent_announcements_card.dart';
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: AppDimensions.sp4),
              UserInfoTile(),
              SizedBox(height: AppDimensions.sp4),
              StatsSection(),
              SizedBox(height: AppDimensions.sp4),
              Row(
                children:  [
                  Expanded(flex: 2, child: RecentAnnouncementsCard()),
                  SizedBox(width: AppDimensions.sp4),
                  Expanded(flex: 1, child: ScheduleSection()),
                ],
              ),
            ],
          ),
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
          RecentAnnouncementsCard(),
          SizedBox(height: AppDimensions.sp4),
          ScheduleSection(),
        ],
      ),
    );
  }
}

