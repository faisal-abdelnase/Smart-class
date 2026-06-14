import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';
import 'package:smart_class/core/utils/extensions.dart';

import 'dashboard_card.dart';
import 'miniStat_card.dart';

class StudentPerformanceOverviewCard extends StatelessWidget {
  const StudentPerformanceOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = theme.extension<AppThemeColors>()!;
    final primary = theme.colorScheme.primary;

    return DashboardCard(
      title: context.tr("student_performance_overview"),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TOP STATS
          Row(
            children: [
              Expanded(
                child: MiniStatCard(
                  title: context.tr("average_grade"),
                  value: "82%",
                  color: Colors.blue,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: MiniStatCard(
                  title: context.tr("top_student"),
                  value: "Ahmed",
                  color: Colors.green,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: MiniStatCard(
                  title: context.tr("weak_student"),
                  value: "John",
                  color: Colors.red,
                ),
              ),
            ],
          ),

          const SizedBox(height: 30),

          Text(
            context.tr("weekly_grades_performance"),
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
              color: t.text1,
            ),
          ),

          const SizedBox(height: 20),

          SizedBox(
            height: 300,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  drawHorizontalLine: true,
                  horizontalInterval: 20,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: t.divider,
                    strokeWidth: 1,
                  ),
                ),

                borderData: FlBorderData(show: false),

                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 30,
                      getTitlesWidget: (value, meta) {
                        const days = [
                          "Mon",
                          "Tue",
                          "Wed",
                          "Thu",
                          "Fri",
                        ];

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            days[value.toInt()],
                            style: const TextStyle(fontSize: 12),
                          ),
                        );
                      },
                    ),
                  ),

                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: 20,
                      reservedSize: 35,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          "${value.toInt()}",
                          style: TextStyle(fontSize: 11, color: t.text2),
                        );
                      },
                    ),
                  ),
                ),

                minX: 0,
                maxX: 4,
                minY: 0,
                maxY: 100,

                lineBarsData: [
                  LineChartBarData(
                    spots: const [
                      FlSpot(0, 70),
                      FlSpot(1, 82),
                      FlSpot(2, 78),
                      FlSpot(3, 90),
                      FlSpot(4, 85),
                    ],

                    isCurved: true,
                    color: primary,
                    barWidth: 4,

                    dotData: const FlDotData(show: true),

                    belowBarData: BarAreaData(
                      show: true,
                      color: primary.withOpacity(0.12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}