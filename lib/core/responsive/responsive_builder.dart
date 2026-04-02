// RESPONSIVE BUILDER WIDGET
// ═══════════════════════════════════════════════════════
import 'package:flutter/material.dart';

import 'app_breakpoints.dart';
import 'app_responsive.dart';

typedef ResponsiveWidgetBuilder = Widget Function(BuildContext, AppResponsive);

class AppResponsiveBuilder extends StatelessWidget {
  final ResponsiveWidgetBuilder mobile;
  final ResponsiveWidgetBuilder? tablet;
  final ResponsiveWidgetBuilder? desktop;

  const AppResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final r = AppResponsive.of(context);
    if (r.isDesktop && desktop != null) return desktop!(context, r);
    if (r.isTablet && tablet != null)   return tablet!(context, r);
    return mobile(context, r);
  }
}

// ═══════════════════════════════════════════════════════
// RESPONSIVE VALUE HELPER
// ═══════════════════════════════════════════════════════
/// Returns a different value based on the current breakpoint.
/// Falls back to smaller breakpoint if larger is not provided.
T responsiveValue<T>(
  BuildContext context, {
  required T xs,
  T? sm,
  T? md,
  T? lg,
  T? xl,
}) {
  final r = AppResponsive.of(context);
  return switch (r.breakpoint) {
    AppBreakpoint.xs => xs,
    AppBreakpoint.sm => sm ?? xs,
    AppBreakpoint.md => md ?? sm ?? xs,
    AppBreakpoint.lg => lg ?? md ?? sm ?? xs,
    AppBreakpoint.xl => xl ?? lg ?? md ?? sm ?? xs,
  };
}