import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/utils/extensions.dart';
import '../widgets/group_post_card.dart';


class PostsView extends StatelessWidget {
  const PostsView({super.key, required this.compact});

  final bool compact;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppThemeColors>()!;

    return ListView(
      padding: EdgeInsets.all(compact ? 12 : 18),
      children: <Widget>[
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
          decoration: BoxDecoration(
            color: tokens.primaryTint,
            borderRadius: BorderRadius.circular(8),
            border: const BorderDirectional(
              start: BorderSide(color: AppColors.primary, width: 3),
            ),
          ),
          child: Text(
            context.tr('group_post_notice'),
            style: AppTypography.bodyMedium.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        const SizedBox(height: 12),
        GroupPostCard(compact: compact),
      ],
    );
  }
}