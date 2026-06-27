import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/utils/extensions.dart';

class GroupDetailsHeader extends StatelessWidget {
  const GroupDetailsHeader({super.key, 
    required this.title,
    required this.memberCount,
    required this.compact,
  });

  final String title;
  final int memberCount;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppThemeColors>()!;

    return Row(
      children: <Widget>[
        OutlinedButton.icon(
          onPressed: context.pop,
          icon: const Icon(Icons.arrow_back_rounded, size: 16),
          label: Text(context.tr('back')),
          style: OutlinedButton.styleFrom(
            foregroundColor: tokens.text1,
            side: BorderSide(color: tokens.borderStrong),
            minimumSize: const Size(0, 34),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(
            title,
            maxLines: compact ? 2 : 1,
            overflow: TextOverflow.ellipsis,
            style: AppTypography.h2.copyWith(
              color: tokens.text1,
              fontSize: compact ? 17 : 20,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
          decoration: BoxDecoration(
            color: AppColors.primaryDark,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            context.tr('members_count_badge', <String, String>{
              'count': memberCount.toString(),
            }),
            style: AppTypography.badge.copyWith(
              color: Colors.white,
              letterSpacing: 0,
            ),
          ),
        )
      ],
    );
  }
}