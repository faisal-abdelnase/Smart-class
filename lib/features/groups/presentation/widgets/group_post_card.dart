import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/utils/extensions.dart';
import 'post_action.dart';

class GroupPostCard extends StatelessWidget {
  const GroupPostCard({super.key, required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppThemeColors>()!;

    return Container(
      padding: EdgeInsets.all(compact ? 16 : 18),
      decoration: BoxDecoration(
        color: tokens.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: tokens.borderStrong),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                radius: 22,
                backgroundColor: AppColors.primary.withValues(alpha: 0.16),
                child: Text(
                  context.tr('group_post_author_initials'),
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      context.tr('group_post_author'),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTypography.h4.copyWith(color: tokens.text1),
                    ),
                    const SizedBox(height: 4),
                    Wrap(
                      spacing: 8,
                      runSpacing: 6,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: tokens.primaryTint,
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            context.tr('instructor_role').toUpperCase(),
                            style: AppTypography.micro.copyWith(
                              color: AppColors.primary,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                        Text(
                          context.tr('one_hour_ago'),
                          style: AppTypography.bodyXSmall.copyWith(
                            color: tokens.text3,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            context.tr('group_post_sample'),
            style: AppTypography.bodyLarge.copyWith(
              color: tokens.text2,
              fontSize: compact ? 14 : 16,
              height: 1.45,
            ),
          ),
          SizedBox(height: compact ? 28 : 40),
          Divider(color: tokens.divider),
          const SizedBox(height: 14),
          Row(
            children: <Widget>[
              PostAction(icon: Icons.favorite_border_rounded, label: '18'),
              const SizedBox(width: 26),
              PostAction(icon: Icons.chat_bubble_outline_rounded, label: '5'),
            ],
          ),
        ],
      ),
    );
  }
}
