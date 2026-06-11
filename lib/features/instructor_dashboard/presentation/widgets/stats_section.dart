import 'package:flutter/material.dart';

import '../../../../core/responsive/responsive_grid.dart';
import '../../../../core/utils/extensions.dart';
import '../widgets/stat_card.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGrid(
      childAspectRatio: 1.8,
      children: [
        StatCard(title: context.tr("total_students"), value: "148", isCardStudent: true,),
        StatCard(title: context.tr("active_groups"), value: "4"),
        StatCard(title: context.tr("exams_pending"), value: "3"),
        StatCard(title: context.tr("pending_join_requests"), value: "4"),
      ],
    );
  }
}