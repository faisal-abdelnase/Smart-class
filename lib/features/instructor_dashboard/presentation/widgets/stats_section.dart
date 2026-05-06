import 'package:flutter/material.dart';

import '../../../../core/responsive/responsive_grid.dart';
import '../widgets/stat_card.dart';

class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return AppGrid(
      childAspectRatio: 1.8,
      children: const [
        StatCard(title: "Total Students", value: "148", isCardStudent: true,),
        StatCard(title: "Active Groups", value: "4"),
        StatCard(title: "Exams Pending", value: "3"),
        StatCard(title: "Avg Score", value: "82%"),
      ],
    );
  }
}