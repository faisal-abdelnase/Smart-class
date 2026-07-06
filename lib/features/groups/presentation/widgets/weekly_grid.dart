import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import '../../domain/entities/schedule_entity.dart';
import 'weekly_table.dart';




class WeeklyGrid extends StatelessWidget {
  const WeeklyGrid({
    super.key,
    required this.days,
    required this.byDay,
    required this.compact,
  });

  final List<DateTime> days;
  final Map<String, List<ScheduleEvent>> byDay;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);

    final bool isMobile = r.isMobile;

    final Widget table = WeeklyTable(
      days: days,
      byDay: byDay,
      compact: compact,
    );

    if (isMobile) {
      return Expanded(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: days.length * 180 + 70,
            ),
            child: SingleChildScrollView(
              child: table,
            ),
          ),
        ),
      );
    }

    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SingleChildScrollView(
          child: table),
      ),
    );
  }
}



