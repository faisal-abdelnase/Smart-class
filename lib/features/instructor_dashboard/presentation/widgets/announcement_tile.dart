
import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/responsive_text.dart';
import 'package:smart_class/core/theme/app_colors.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';

import '../../../../core/utils/extensions.dart';
import 'action_button.dart';

class AnnouncementTile extends StatelessWidget {
  final Color dotColor;

  final String tag;
  final Color tagColor;
  final Color tagTextColor;

  final String time;
  final String title;
  final String description;

  final int likes;
  final int comments;

  const AnnouncementTile({
    super.key,
    required this.dotColor,
    required this.tag,
    required this.tagColor,
    required this.tagTextColor,
    required this.time,
    required this.title,
    required this.description, required this.likes, required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      
        const SizedBox(width: 18),

        // CONTENT
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TOP ROW
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: tagColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      tag,
                      style: AppTypography.labelMedium.copyWith(
                        color: tagTextColor,
                        
                      ),
                    ),
                  ),

                  Text(
                    time,
                    style: AppTypography.labelMedium.copyWith(
                      color: AppColors.lightText3,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // TITLE

              AppText(title, baseFontSize: 18, style: AppTypography.h1.copyWith(color: AppColors.lightText1)),

              const SizedBox(height: 10),

              // DESCRIPTION
              AppText(description, baseFontSize: 16, style: AppTypography.h3.copyWith(
                color: AppColors.lightText2,
                fontWeight: FontWeight.w300
              )),

              const SizedBox(height: 20),

               // ACTIONS
              Row(
                children: [
                  ActionButton(
                    icon: Icons.favorite_border,
                    label: "$likes ${context.tr("likes")}",
                    onTap: () {},
                  ),

                  const SizedBox(width: 16),

                  ActionButton(
                    icon: Icons.mode_comment_outlined,
                    label: "$comments ${context.tr("comments")}",
                    onTap: () {},
                  ),

                  const SizedBox(width: 16),

                  ActionButton(
                    icon: Icons.share_outlined,
                    label: context.tr("share"),
                    onTap: () {},
                  ),
                ],
              ),

            ],
          ),
        ),
      ],
    );
  }
}











