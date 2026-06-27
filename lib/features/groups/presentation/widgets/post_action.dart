import 'package:flutter/material.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_theme_extensions.dart';

class PostAction extends StatelessWidget {
  const PostAction({super.key, required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    final tokens = Theme.of(context).extension<AppThemeColors>()!;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(icon, size: 19, color: tokens.text3),
        const SizedBox(width: 5),
        Text(
          label,
          style: AppTypography.bodySmall.copyWith(color: tokens.text3),
        ),
      ],
    );
  }
}

