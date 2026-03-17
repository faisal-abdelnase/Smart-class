import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_colors.dart';


/// EduConnect custom ThemeExtension — gives access to
/// app-specific tokens via Theme.of(context).extension<AppThemeColors>()
@immutable
class AppThemeColors extends ThemeExtension<AppThemeColors> {
  const AppThemeColors({
    required this.bg,
    required this.bgAlt,
    required this.surface,
    required this.surfaceRaised,
    required this.surfaceOverlay,
    required this.sidebar,
    required this.border,
    required this.borderStrong,
    required this.divider,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
    required this.textInverse,
    required this.primaryTint,
    required this.accentTint,
    required this.greenTint,
    required this.purpleTint,
    required this.yellowTint,
    required this.redTint,
  });

  final Color bg;
  final Color bgAlt;
  final Color surface;
  final Color surfaceRaised;
  final Color surfaceOverlay;
  final Color sidebar;
  final Color border;
  final Color borderStrong;
  final Color divider;
  final Color text1;
  final Color text2;
  final Color text3;
  final Color text4;
  final Color textInverse;
  final Color primaryTint;
  final Color accentTint;
  final Color greenTint;
  final Color purpleTint;
  final Color yellowTint;
  final Color redTint;

  static const light = AppThemeColors(
    bg:             AppColors.lightBg,
    bgAlt:          AppColors.lightBgAlt,
    surface:        AppColors.lightSurface,
    surfaceRaised:  AppColors.lightSurfaceRaised,
    surfaceOverlay: AppColors.lightSurface,
    sidebar:        AppColors.lightSidebar,
    border:         AppColors.lightBorder,
    borderStrong:   AppColors.lightBorderStrong,
    divider:        AppColors.lightDivider,
    text1:          AppColors.lightText1,
    text2:          AppColors.lightText2,
    text3:          AppColors.lightText3,
    text4:          AppColors.lightText4,
    textInverse:    Colors.white,
    primaryTint:    AppColors.primary50,
    accentTint:     AppColors.accent50,
    greenTint:      AppColors.green50,
    purpleTint:     AppColors.purple50,
    yellowTint:     AppColors.yellow50,
    redTint:        AppColors.red50,
  );

  static const dark = AppThemeColors(
    bg:             AppColors.darkBg,
    bgAlt:          AppColors.darkBgAlt,
    surface:        AppColors.darkSurface,
    surfaceRaised:  AppColors.darkSurfaceRaised,
    surfaceOverlay: AppColors.darkSurfaceOverlay,
    sidebar:        AppColors.darkSidebar,
    border:         AppColors.darkBorder,
    borderStrong:   AppColors.darkBorderStrong,
    divider:        AppColors.darkDivider,
    text1:          AppColors.darkText1,
    text2:          AppColors.darkText2,
    text3:          AppColors.darkText3,
    text4:          AppColors.darkText4,
    textInverse:    AppColors.darkBg,
    primaryTint:    Color(0x261A56FF),
    accentTint:     Color(0x26FF6B2B),
    greenTint:      Color(0x1F22C55E),
    purpleTint:     Color(0x268B5CF6),
    yellowTint:     Color(0x1FF59E0B),
    redTint:        Color(0x1FEF4444),
  );

  @override
  AppThemeColors copyWith({
    Color? bg, Color? bgAlt, Color? surface, Color? surfaceRaised,
    Color? surfaceOverlay, Color? sidebar, Color? border, Color? borderStrong,
    Color? divider, Color? text1, Color? text2, Color? text3, Color? text4,
    Color? textInverse, Color? primaryTint, Color? accentTint, Color? greenTint,
    Color? purpleTint, Color? yellowTint, Color? redTint,
  }) => AppThemeColors(
    bg:             bg             ?? this.bg,
    bgAlt:          bgAlt          ?? this.bgAlt,
    surface:        surface        ?? this.surface,
    surfaceRaised:  surfaceRaised  ?? this.surfaceRaised,
    surfaceOverlay: surfaceOverlay ?? this.surfaceOverlay,
    sidebar:        sidebar        ?? this.sidebar,
    border:         border         ?? this.border,
    borderStrong:   borderStrong   ?? this.borderStrong,
    divider:        divider        ?? this.divider,
    text1:          text1          ?? this.text1,
    text2:          text2          ?? this.text2,
    text3:          text3          ?? this.text3,
    text4:          text4          ?? this.text4,
    textInverse:    textInverse    ?? this.textInverse,
    primaryTint:    primaryTint    ?? this.primaryTint,
    accentTint:     accentTint     ?? this.accentTint,
    greenTint:      greenTint      ?? this.greenTint,
    purpleTint:     purpleTint     ?? this.purpleTint,
    yellowTint:     yellowTint     ?? this.yellowTint,
    redTint:        redTint        ?? this.redTint,
  );

  @override
  AppThemeColors lerp(AppThemeColors? other, double t) {
    if (other == null) return this;
    return AppThemeColors(
      bg:             Color.lerp(bg, other.bg, t)!,
      bgAlt:          Color.lerp(bgAlt, other.bgAlt, t)!,
      surface:        Color.lerp(surface, other.surface, t)!,
      surfaceRaised:  Color.lerp(surfaceRaised, other.surfaceRaised, t)!,
      surfaceOverlay: Color.lerp(surfaceOverlay, other.surfaceOverlay, t)!,
      sidebar:        Color.lerp(sidebar, other.sidebar, t)!,
      border:         Color.lerp(border, other.border, t)!,
      borderStrong:   Color.lerp(borderStrong, other.borderStrong, t)!,
      divider:        Color.lerp(divider, other.divider, t)!,
      text1:          Color.lerp(text1, other.text1, t)!,
      text2:          Color.lerp(text2, other.text2, t)!,
      text3:          Color.lerp(text3, other.text3, t)!,
      text4:          Color.lerp(text4, other.text4, t)!,
      textInverse:    Color.lerp(textInverse, other.textInverse, t)!,
      primaryTint:    Color.lerp(primaryTint, other.primaryTint, t)!,
      accentTint:     Color.lerp(accentTint, other.accentTint, t)!,
      greenTint:      Color.lerp(greenTint, other.greenTint, t)!,
      purpleTint:     Color.lerp(purpleTint, other.purpleTint, t)!,
      yellowTint:     Color.lerp(yellowTint, other.yellowTint, t)!,
      redTint:        Color.lerp(redTint, other.redTint, t)!,
    );
  }
}
