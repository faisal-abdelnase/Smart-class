

import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import 'announcement_tile.dart';

class RecentAnnouncementsCard extends StatelessWidget {
  const RecentAnnouncementsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: const Color(0xffE5E7EB),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recent Announcements",
                style: AppTypography.h1.copyWith(color: AppColors.lightText1),
              ),

              // POST BUTTON
              CustomElevatedButton(text: "+ Post", onPressed: () {}),
            ],
          ),

          const SizedBox(height: 28),

          const AnnouncementTile(
            dotColor: Color(0xff2952FF),
            tag: "MATH 10A",
            tagColor: Color(0xffEEF2FF),
            tagTextColor: Color(0xff2952FF),
            time: "Today, 9:30 AM",
            title: "Midterm Exam — Chapter 5 & 6",
            description:
                "The midterm will cover trigonometry and quadratic equations. Please review the practice sheets.",

            likes: 124,
            comments: 32,
          ),

          const Divider(height: 40),

          const AnnouncementTile(
            dotColor: Color(0xff22C55E),
            tag: "SCIENCE 9B",
            tagColor: Color(0xffECFDF3),
            tagTextColor: Color(0xff16A34A),
            time: "Yesterday, 2:15 PM",
            title: "Lab Report Submission — Due Friday",
            description:
                "Please submit your completed lab reports through the portal by 11:59 PM.",

            likes: 88,
            comments: 14,
          ),

          const Divider(height: 40),

          const AnnouncementTile(
            dotColor: Color(0xffF97316),
            tag: "ALL GROUPS",
            tagColor: Color(0xffFFF7ED),
            tagTextColor: Color(0xffEA580C),
            time: "Mar 6, 11:00 AM",
            title: "Parent–Teacher Meeting — March 15",
            description:
                "Online meeting scheduled. Parents will receive calendar invites shortly.",

            likes: 56,
            comments: 9,
          ),
        ],
      ),
    );
  }
}

