import 'package:flutter/material.dart';

import '../../../../core/responsive/adaptive_scaffold.dart';
import 'dashboard_app_bar.dart';
import 'dashboard_body.dart';


class DashboardMobile extends StatefulWidget {
  const DashboardMobile({super.key});

  @override
  State<DashboardMobile> createState() => _DashboardMobileState();
}

class _DashboardMobileState extends State<DashboardMobile> {

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