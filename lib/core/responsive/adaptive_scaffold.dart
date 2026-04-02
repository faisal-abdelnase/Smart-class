// ADAPTIVE LAYOUT SCAFFOLD
// ═══════════════════════════════════════════════════════
import 'package:flutter/material.dart';

import 'app_breakpoints.dart';
import 'app_responsive.dart';

/// Wraps the app in the correct nav structure per breakpoint.
/// Mobile:  bottom nav bar
/// Tablet:  navigation rail (left)
/// Desktop: navigation drawer (left, expanded)
class AdaptiveScaffold extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<AdaptiveNavItem> destinations;
  final Widget body;
  final Color roleColor;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;

  const AdaptiveScaffold({
    super.key,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.destinations,
    required this.body,
    required this.roleColor,
    this.appBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);
    return switch (r.navType) {
      AppNavType.bottom  => _BottomNavLayout(widget: this, r: r),
      AppNavType.rail    => _RailLayout(widget: this, r: r),
      AppNavType.drawer  => _DrawerLayout(widget: this, r: r),
    };
  }
}

class AdaptiveNavItem {
  final IconData icon;
  final IconData activeIcon;
  final String label;
  const AdaptiveNavItem({required this.icon, required this.activeIcon, required this.label});
}

// ── Bottom Nav (mobile) ─────────────────────────────────
class _BottomNavLayout extends StatelessWidget {
  final AdaptiveScaffold widget;
  final AppResponsive r;
  const _BottomNavLayout({required this.widget, required this.r});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Scaffold(
      backgroundColor: t.scaffoldBackgroundColor,
      appBar: widget.appBar,
      floatingActionButton: widget.floatingActionButton,
      bottomNavigationBar: NavigationBar(
        selectedIndex:        widget.selectedIndex,
        onDestinationSelected: widget.onDestinationSelected,
        indicatorColor: widget.roleColor.withOpacity(0.12),
        destinations: widget.destinations.map((d) => NavigationDestination(
          icon:          Icon(d.icon),
          selectedIcon:  Icon(d.activeIcon, color: widget.roleColor),
          label:         d.label,
        )).toList(),
      ),
      body: widget.body,
    );
  }
}

// ── Rail Nav (tablet) ───────────────────────────────────
class _RailLayout extends StatelessWidget {
  final AdaptiveScaffold widget;
  final AppResponsive r;
  const _RailLayout({required this.widget, required this.r});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Scaffold(
      backgroundColor: t.scaffoldBackgroundColor,
      appBar: widget.appBar,
      floatingActionButton: widget.floatingActionButton,
      body: Row(
        children: [
          NavigationRail(
            selectedIndex:          widget.selectedIndex,
            onDestinationSelected:  widget.onDestinationSelected,
            selectedIconTheme:  IconThemeData(color: widget.roleColor),
            indicatorColor:     widget.roleColor.withOpacity(0.12),
            labelType:          NavigationRailLabelType.all,
            destinations: widget.destinations.map((d) => NavigationRailDestination(
              icon:          Icon(d.icon),
              selectedIcon:  Icon(d.activeIcon),
              label:         Text(d.label),
            )).toList(),
          ),
          const VerticalDivider(width: 1),
          Expanded(child: widget.body),
        ],
      ),
    );
  }
}

// ── Drawer Nav (desktop) ────────────────────────────────
class _DrawerLayout extends StatelessWidget {
  final AdaptiveScaffold widget;
  final AppResponsive r;
  const _DrawerLayout({required this.widget, required this.r});

  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context);
    return Scaffold(
      backgroundColor: t.scaffoldBackgroundColor,
      appBar: widget.appBar,
      floatingActionButton: widget.floatingActionButton,
      body: Row(
        children: [
          SizedBox(
            width: r.sideNavWidth,
            child: NavigationDrawer(
              selectedIndex:          widget.selectedIndex,
              onDestinationSelected:  widget.onDestinationSelected,
              indicatorColor: widget.roleColor.withOpacity(0.12),
              children: [
                const SizedBox(height: 12),
                ...widget.destinations.map((d) => NavigationDrawerDestination(
                  icon:          Icon(d.icon),
                  selectedIcon:  Icon(d.activeIcon, color: widget.roleColor),
                  label:         Text(d.label),
                )),
              ],
            ),
          ),
          const VerticalDivider(width: 1),
          Expanded(child: widget.body),
        ],
      ),
    );
  }
}