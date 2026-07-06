import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smart_class/core/responsive/app_responsive.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';
import '../../domain/entities/schedule_entity.dart';
import '../widgets/schedule_header.dart';
import '../widgets/days_header.dart';
import '../widgets/weekly_grid.dart';



class ScheduleView extends StatefulWidget {
  const ScheduleView({super.key, this.events, required this.compact});

  final List<ScheduleEvent>? events;
  final bool compact;

  @override
  State<ScheduleView> createState() => _ScheduleViewState();
}




class _ScheduleViewState extends State<ScheduleView> {
  late DateTime _weekStart; // Monday

  @override
  void initState() {
    super.initState();
    final today = DateTime.now();
    _weekStart = _mondayOfWeek(today);
  }

  DateTime _mondayOfWeek(DateTime dt) {
    final dow = dt.weekday; // 1 = Mon
    return DateTime(dt.year, dt.month, dt.day).subtract(Duration(days: dow - 1));
  }

  void _changeWeek(int deltaWeeks) {
    setState(() {
      _weekStart = _weekStart.add(Duration(days: 7 * deltaWeeks));
    });
  }

  


  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);
    final tokens = Theme.of(context).extension<AppThemeColors>()!;
    final locale = Localizations.localeOf(context).languageCode;
    final data = widget.events ?? _buildSampleEvents();

    
    final days = List.generate(7, (i) => _weekStart.add(Duration(days: i)));

    
    final Map<String, List<ScheduleEvent>> byDay = {};
    for (final e in data) {
      final key = DateFormat('yyyy-MM-dd').format(e.date);
      byDay.putIfAbsent(key, () => []).add(e);
    }


    return Container(
      color: tokens.surface,
      padding: EdgeInsets.all(r.sp(12)),
      child: Column(
        children: [
          ScheduleHeader(
            title: DateFormat('MMMM yyyy', locale).format(_weekStart),
            onPrev: () => _changeWeek(-1),
            onToday: () => setState(() => _weekStart = _mondayOfWeek(DateTime.now())),
            onNext: () => _changeWeek(1),
          ),

          SizedBox(height: r.sp(12)),

          DaysHeader(days: days),

          const SizedBox(height: 8),

          WeeklyGrid(compact: widget.compact , days: days, byDay: byDay),
        ],
      ),
    );
  }

  List<ScheduleEvent> _buildSampleEvents() {
    final now = DateTime.now();
    final base = _mondayOfWeek(now);
    return [
      ScheduleEvent(date: base.add(Duration(days: 0, hours: 9)), title: 'Lesson 1', type: EventType.lecture),
      ScheduleEvent(date: base.add(Duration(days: 1, hours: 10)), title: 'Lesson 2', type: EventType.lecture),
      ScheduleEvent(date: base.add(Duration(days: 2, hours: 9)), title: 'Review', type: EventType.review),
      ScheduleEvent(date: base.add(Duration(days: 4, hours: 11)), title: 'Lesson 3', type: EventType.lecture),
      ScheduleEvent(date: base.add(Duration(days: 1, hours: 14)), title: 'Lesson 4', type: EventType.lecture),
      ScheduleEvent(date: base.add(Duration(days: 2, hours: 14)), title: 'Exam', type: EventType.exam),
    ];
  }
}
