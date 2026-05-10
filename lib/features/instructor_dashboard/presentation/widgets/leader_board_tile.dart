import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_colors.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';

class LeaderboardTile extends StatelessWidget {
  final int rank;
  final String name;
  final String score;

  const LeaderboardTile({
    super.key,
    required this.rank,
    required this.name,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: AppColors.primary50,
          child: Text(
            "$rank",
            style: AppTypography.codeLabel.copyWith(color: AppColors.primary),
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: Text(
            name,
            style: AppTypography.bodyMedium.copyWith(fontWeight: FontWeight.w600),
          ),
        ),

        Text(
          score,
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.greenHover,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
