import 'package:flutter/material.dart';
import 'package:smart_class/features/instructor_dashboard/presentation/widgets/dashboard_app_bar.dart';

import '../../../../core/responsive/adaptive_scaffold.dart';
import 'dashboard_body.dart';


class DashboardTablet extends StatefulWidget {
  const DashboardTablet({super.key});

  @override
  State<DashboardTablet> createState() => _DashboardTabletState();
}

class _DashboardTabletState extends State<DashboardTablet> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      selectedIndex: index,
      onDestinationSelected: (i) => setState(() => index = i),
      roleColor: Colors.blue,
      appBar: const DashboardAppBar(),
      destinations: const [
        AdaptiveNavItem(icon: Icons.dashboard, activeIcon: Icons.dashboard, label: "Dashboard"),
        AdaptiveNavItem(icon: Icons.group, activeIcon: Icons.group, label: "Groups"),
        AdaptiveNavItem(icon: Icons.post_add, activeIcon: Icons.post_add, label: "Posts"),
        AdaptiveNavItem(icon: Icons.schedule, activeIcon: Icons.schedule, label: "Schedule"),
      ],
      body: const DashboardBody(),
    );
  }
}