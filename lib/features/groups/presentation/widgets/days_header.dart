import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';

class DaysHeader extends StatelessWidget {
  const DaysHeader({super.key, required this.days});

  final List<DateTime> days;

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);
    final tokens = Theme.of(context).extension<AppThemeColors>()!;
    final locale = Localizations.localeOf(context).languageCode;

    final today = DateTime.now();
    return Row(
      children: [
        SizedBox(width: r.sp(60)),
        ...days.map((d) {
          final isToday = d.year == today.year && d.month == today.month && d.day == today.day;
          final dayColor = isToday ? Theme.of(context).colorScheme.primary : tokens.text2;
          final dateColor = isToday ? Theme.of(context).colorScheme.primary : tokens.text3;

          return Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: r.sp(8)),
              decoration: BoxDecoration(
                color: tokens.surfaceRaised,
                border: Border.all(color: tokens.border),
              ),
              child: Column(
                children: [
                  Text(
                    DateFormat.E(locale).format(d),
                    style: TextStyle(color: dayColor, fontWeight: FontWeight.w700),
                  ),
                  Text(
                    DateFormat.MMMd(locale).format(d),
                    style: TextStyle(color: dateColor, fontSize: r.captionSize),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
