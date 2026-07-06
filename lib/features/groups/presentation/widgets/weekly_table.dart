import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/responsive/app_responsive.dart';
import '../../../../core/theme/app_theme_extensions.dart';
import '../../domain/entities/schedule_entity.dart';

class WeeklyTable extends StatelessWidget {
  const WeeklyTable({super.key, 
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
    final tokens = Theme.of(context).extension<AppThemeColors>()!;
    final locale = Localizations.localeOf(context).languageCode;

    final hourRows = [9, 10, 11, 14, 15, 16];

    return Column(
      children: hourRows.map((h) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: r.sp(60),
              child: Padding(
                padding: EdgeInsets.all(r.sp(8)),
                child: Text(
                  '$h:00',
                  style: TextStyle(color: tokens.text3),
                ),
              ),
            ),

            ...days.map((d) {
              final key = DateFormat('yyyy-MM-dd').format(d);
              final list = byDay[key] ?? [];

              final cellEvent = list.firstWhere(
                (e) => e.date.hour == h,
                orElse: () => ScheduleEvent(
                  date: d,
                  title: '',
                  type: EventType.lecture,
                ),
              );

              final hasEvent = cellEvent.title.isNotEmpty;

              return SizedBox(
                width: compact ? 160 : 190,
                child: Container(
                  margin: EdgeInsets.all(r.sp(6)),
                  padding: EdgeInsets.only(
                    right: r.sp(8),
                    top: r.sp(8),
                    bottom: r.sp(8),
                  ),
                  height: r.sp(70),
                  decoration: BoxDecoration(
                    color: hasEvent
                        ? ScheduleEvent.colorFor(cellEvent.type, .2)
                        : tokens.surfaceRaised,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: tokens.border),
                  ),
                  child: hasEvent
                      ? Row(
                          children: [
                            Container(
                              width: 6,
                              decoration: BoxDecoration(
                                color: ScheduleEvent.colorFor(
                                  cellEvent.type,
                                  1,
                                ),
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                              ),
                            ),
                            SizedBox(width: r.sp(10)),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cellEvent.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: ScheduleEvent.colorFor(
                                        cellEvent.type,
                                        1,
                                      ),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Spacer(),
                                  Text(
                                    DateFormat.jm(locale)
                                        .format(cellEvent.date),
                                    style: TextStyle(
                                      fontSize: r.captionSize,
                                      color: tokens.text1.withValues(
                                        alpha: .9,
                                      ),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : const SizedBox(),
                ),
              );
            }),
          ],
        );
      }).toList(),
    );
  }
}