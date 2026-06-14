import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_colors.dart';

import '../../../../core/utils/extensions.dart';
import 'dashboard_card.dart';
import 'schedule_tile.dart';

class UpcomingScheduleCard extends StatelessWidget {
  const UpcomingScheduleCard({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardCard(
      title: context.tr("upcoming_schedule"),
      child: Column(
        children: const [
          ScheduleTile(
            subject: "Math 10A - Live Class",
            time: "09:00 AM",
            type: "Zoom Meeting",
            color: AppColors.primary,
          ),
          SizedBox(height: 12),
          ScheduleTile(
            subject: "Science 9B - Exam",
            time: "11:30 AM",
            type: "Exam Session",
            color: AppColors.accent,
          ),
          SizedBox(height: 12),
          ScheduleTile(
            subject: "History 11C - Review",
            time: "02:00 PM",
            type: "Discussion",
            color: AppColors.green,
          ),
        ],
      ),
    );
  }
}

