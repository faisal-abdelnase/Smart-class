// RESPONSIVE DATA CLASS
// ═══════════════════════════════════════════════════════
import 'package:flutter/material.dart';

import '../theme/app_dimension.dart';
import 'app_breakpoints.dart';

class AppResponsive {
  AppResponsive._({
    required this.screenWidth,
    required this.screenHeight,
    required this.breakpoint,
    required this.devicePixelRatio,
    required this.textScaleFactor,
    required this.platformIsWeb,
    required this.orientation,
  });

  final double screenWidth;
  final double screenHeight;
  final AppBreakpoint breakpoint;
  final double devicePixelRatio;
  final double textScaleFactor;
  final bool platformIsWeb;
  final Orientation orientation;

  // ── Factory ─────────────────────────────────────────
  factory AppResponsive.of(BuildContext context) {
    final mq = MediaQuery.of(context);
    final w = mq.size.width;
    return AppResponsive._(
      screenWidth: w,
      screenHeight: mq.size.height,
      breakpoint: _breakpointFor(w),
      devicePixelRatio: mq.devicePixelRatio,
      textScaleFactor: mq.textScaler.scale(1.0),
      platformIsWeb: identical(0, 0.0), // override per platform
      orientation: mq.orientation,
    );
  }

  static AppBreakpoint _breakpointFor(double w) {
    if (w < 360) return AppBreakpoint.xs;
    if (w < 600) return AppBreakpoint.sm;
    if (w < 840) return AppBreakpoint.md;
    if (w < 1200) return AppBreakpoint.lg;
    return AppBreakpoint.xl;
  }

  // ── Boolean helpers ─────────────────────────────────
  bool get isXS      => breakpoint == AppBreakpoint.xs;
  bool get isSM      => breakpoint == AppBreakpoint.sm;
  bool get isMD      => breakpoint == AppBreakpoint.md;
  bool get isLG      => breakpoint == AppBreakpoint.lg;
  bool get isXL      => breakpoint == AppBreakpoint.xl;

  bool get isMobile  => breakpoint.index <= AppBreakpoint.sm.index;
  bool get isTablet  => breakpoint == AppBreakpoint.md || breakpoint == AppBreakpoint.lg;
  bool get isDesktop => breakpoint == AppBreakpoint.xl;
  bool get isLandscape => orientation == Orientation.landscape;
  bool get isPortrait  => orientation == Orientation.portrait;

  // ── Compact phone ────────────────────────────────────
  bool get isCompact => isXS || (isSM && screenWidth < 400);

  // ── Grid columns ────────────────────────────────────
  int get cols => switch (breakpoint) {
    AppBreakpoint.xs => 1,
    AppBreakpoint.sm => 2,
    AppBreakpoint.md => 2,
    AppBreakpoint.lg => 3,
    AppBreakpoint.xl => 4,
  };

  int get statCols => switch (breakpoint) {
    AppBreakpoint.xs => 2,
    AppBreakpoint.sm => 2,
    AppBreakpoint.md => 4,
    AppBreakpoint.lg => 4,
    AppBreakpoint.xl => 4,
  };

  // ── Spacing scale (multiplied by breakpoint factor) ─
  double sp(double base) {
    final factor = switch (breakpoint) {
      AppBreakpoint.xs => 0.80,
      AppBreakpoint.sm => 1.00,
      AppBreakpoint.md => 1.10,
      AppBreakpoint.lg => 1.20,
      AppBreakpoint.xl => 1.30,
    };
    return base * factor;
  }

  // ── Font size scale ──────────────────────────────────
  double fs(double base) {
    final factor = switch (breakpoint) {
      AppBreakpoint.xs => 0.85,
      AppBreakpoint.sm => 1.00,
      AppBreakpoint.md => 1.05,
      AppBreakpoint.lg => 1.10,
      AppBreakpoint.xl => 1.15,
    };
    return base * factor;
  }

  // ── Percentage helpers ──────────────────────────────
  double hp(double percent) => screenHeight * percent;
  double wp(double percent) => screenWidth * percent;

  // ── Content max width ───────────────────────────────
  double get contentMaxWidth => switch (breakpoint) {
    AppBreakpoint.xs => screenWidth,
    AppBreakpoint.sm => screenWidth,
    AppBreakpoint.md => 600,
    AppBreakpoint.lg => 840,
    AppBreakpoint.xl => 1140,
  };

  // ── Horizontal padding ──────────────────────────────
  double get hPadding => switch (breakpoint) {
    AppBreakpoint.xs => AppDimensions.sp3,
    AppBreakpoint.sm => AppDimensions.sp4,
    AppBreakpoint.md => AppDimensions.sp6,
    AppBreakpoint.lg => AppDimensions.sp8,
    AppBreakpoint.xl => AppDimensions.sp10,
  };

  EdgeInsets get screenPadding => EdgeInsets.symmetric(horizontal: hPadding);

  // ── Navigation type ──────────────────────────────────
  AppNavType get navType => switch (breakpoint) {
    AppBreakpoint.xs => AppNavType.bottom,
    AppBreakpoint.sm => AppNavType.bottom,
    AppBreakpoint.md => AppNavType.rail,
    AppBreakpoint.lg => AppNavType.rail,
    AppBreakpoint.xl => AppNavType.drawer,
  };

  // ── Card aspect ratio ────────────────────────────────
  double get statCardAspect => switch (breakpoint) {
    AppBreakpoint.xs => 1.3,
    AppBreakpoint.sm => 1.5,
    AppBreakpoint.md => 1.6,
    AppBreakpoint.lg => 1.7,
    AppBreakpoint.xl => 1.8,
  };

  // ── Avatar sizes ─────────────────────────────────────
  double get avatarGreeting => switch (breakpoint) {
    AppBreakpoint.xs => AppDimensions.avatarMD,
    AppBreakpoint.sm => AppDimensions.avatarLG,
    AppBreakpoint.md => AppDimensions.avatarLG,
    AppBreakpoint.lg => AppDimensions.avatarXL,
    AppBreakpoint.xl => AppDimensions.avatarXL,
  };

  // ── Font size shortcuts ──────────────────────────────
  double get displaySize => fs(isCompact ? 26 : isMobile ? 28 : isTablet ? 34 : 40);
  double get h1Size      => fs(isCompact ? 18 : isMobile ? 20 : isTablet ? 22 : 26);
  double get h2Size      => fs(isCompact ? 16 : isMobile ? 18 : isTablet ? 20 : 22);
  double get bodySize    => fs(isCompact ? 12 : 14);
  double get captionSize => fs(isCompact ? 10 : 11);

  // ── Sidebar width ────────────────────────────────────
  double get sideNavWidth => isDesktop ? 260 : 72;

  @override
  String toString() =>
      'AppResponsive(${breakpoint.name}, ${screenWidth.toInt()}×${screenHeight.toInt()}, nav: ${navType.name})';
}