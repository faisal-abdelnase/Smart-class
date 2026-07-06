import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';
import 'package:smart_class/core/utils/extensions.dart';

class ScheduleHeader extends StatelessWidget {
  const ScheduleHeader({
    super.key,
    required this.title,
    required this.onPrev,
    required this.onToday,
    required this.onNext,
  });

  final String title;
  final VoidCallback onPrev;
  final VoidCallback onToday;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);
    final tokens = Theme.of(context).extension<AppThemeColors>()!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 16,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            style: TextStyle(
              fontSize: r.h2Size,
              color: tokens.text1,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Row(
          children: [
            TextButton.icon(
              onPressed: onPrev,
              icon: const Icon(Icons.chevron_left),
              label: Text(context.tr('prev_week')),
            ),
            const SizedBox(width: 6),
            ElevatedButton(
              onPressed: onToday,
              child: Text(context.tr('today')),
            ),
            const SizedBox(width: 6),
            TextButton.icon(
              onPressed: onNext,
              icon: const Icon(Icons.chevron_right),
              label: Text(context.tr('next_week')),
            ),
          ],
        ),
      ],
    );
  }
}
