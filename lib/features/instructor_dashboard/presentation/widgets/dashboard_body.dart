import 'package:flutter/material.dart';
import 'package:smart_class/features/instructor_dashboard/presentation/widgets/leaderboard_card.dart';
import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/theme/app_dimension.dart';
import 'recent_announcements_card.dart';
import 'student_performance_overview_card.dart';
import 'upcoming_schedule_card.dart';
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
              StudentPerformanceOverviewCard(),
              SizedBox(height: AppDimensions.sp4),
              Row(
                children:  [
                  const Expanded(flex: 2, child: RecentAnnouncementsCard()),
                  const SizedBox(width: AppDimensions.sp4),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        UpcomingScheduleCard(),
                        SizedBox(height: AppDimensions.sp4),
                        LeaderboardCard(),
                        SizedBox(height: AppDimensions.sp4),
                        
                      ],
                    ),
                  ),
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
        children: const [
          SizedBox(height: AppDimensions.sp4),
          UserInfoTile(),
          SizedBox(height: AppDimensions.sp4),
          StatsSection(),
          SizedBox(height: AppDimensions.sp4),
          StudentPerformanceOverviewCard(),
          SizedBox(height: AppDimensions.sp4),
          RecentAnnouncementsCard(),
          SizedBox(height: AppDimensions.sp4),
          UpcomingScheduleCard(),
          SizedBox(height: AppDimensions.sp4),
          LeaderboardCard(),
          SizedBox(height: AppDimensions.sp4),
          
        ],
      ),
    );
  }
}

