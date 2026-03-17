import 'package:flutter/material.dart';
class AppColors {
  AppColors._();

  
  // Blue 

  static const Color primary      = Color(0xFF1A56FF);
  static const Color primaryHover = Color(0xFF1244D6);
  static const Color primaryDark  = Color(0xFF0A35CC);
  static const Color primaryLight = Color(0xFF4F8AFF);
  static const Color primaryPale  = Color(0xFFA3C0FF);
  static const Color primary100   = Color(0xFFD0DEFF);
  static const Color primary50    = Color(0xFFE8EEFF);



  // Orange

  static const Color accent      = Color(0xFFFF6B2B);
  static const Color accentHover = Color(0xFFE85520);
  static const Color accentDark  = Color(0xFFCC4A10);
  static const Color accentLight = Color(0xFFFF8F5C);
  static const Color accent100   = Color(0xFFFFD4BC);
  static const Color accent50    = Color(0xFFFFF0E8);


  // Green (Student role)

  static const Color green      = Color(0xFF22C55E);
  static const Color greenHover = Color(0xFF16A34A);
  static const Color greenDark  = Color(0xFF14532D);
  static const Color greenLight = Color(0xFF4ADE80);
  static const Color green100   = Color(0xFFBBF7D0);
  static const Color green50    = Color(0xFFE8FAF0);


  // PURPLE

  static const Color purple      = Color(0xFF8B5CF6);
  static const Color purpleHover = Color(0xFF7C3AED);
  static const Color purpleDark  = Color(0xFF4C1D95);
  static const Color purpleLight = Color(0xFFA78BFA);
  static const Color purple100   = Color(0xFFDDD6FE);
  static const Color purple50    = Color(0xFFF0EBFF);


  // Yellow

  static const Color yellow      = Color(0xFFF59E0B);
  static const Color yellowHover = Color(0xFFD97706);
  static const Color yellowDark  = Color(0xFF78350F);
  static const Color yellowLight = Color(0xFFFCD34D);
  static const Color yellow100   = Color(0xFFFDE68A);
  static const Color yellow50    = Color(0xFFFFFBEB);


  // Red

  static const Color red      = Color(0xFFEF4444);
  static const Color redHover = Color(0xFFDC2626);
  static const Color redDark  = Color(0xFF7F1D1D);
  static const Color redLight = Color(0xFFF87171);
  static const Color red100   = Color(0xFFFECACA);
  static const Color red50    = Color(0xFFFEF2F2);


  // ROLE IDENTITY

  static const Color roleInstructor = primary;
  static const Color roleStudent    = green;
  static const Color roleParent     = purple;


  // GRADIENTS

  static const LinearGradient gradientPrimary = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primaryDark, primary, primaryLight],
  );

  static const LinearGradient gradientAccent = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentDark, accent, accentLight],
  );

  static const LinearGradient gradientGreen = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [greenDark, green, greenLight],
  );

  static const LinearGradient gradientPurple = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [purpleDark, purple, purpleLight],
  );

  static const LinearGradient gradientDarkAI = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0D0F1A), Color(0xFF1A1550)],
  );

  static const LinearGradient gradientBluePurple = LinearGradient(
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
    colors: [primary, purple],
  );

  static const LinearGradient gradientErrorAlert = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [red, accent],
  );

  // LIGHT MODE — Surfaces & Text

  static const Color lightBg        = Color(0xFFF7F8FC);
  static const Color lightBgAlt     = Color(0xFFECEEF6);
  static const Color lightSurface   = Color(0xFFFFFFFF);
  static const Color lightSurfaceRaised  = Color(0xFFFFFFFF);
  static const Color lightBorder    = Color(0xFFE4E7F0);
  static const Color lightBorderStrong = Color(0xFFC8CDE0);
  static const Color lightDivider   = Color(0xFFF0F1F8);
  static const Color lightSidebar   = Color(0xFF0D0F1A);

  static const Color lightText1 = Color(0xFF0D0F1A); // Headings
  static const Color lightText2 = Color(0xFF5A5F7A); // Body
  static const Color lightText3 = Color(0xFF9EA3BE); // Caption
  static const Color lightText4 = Color(0xFFC8CCDE); // Disabled


  // DARK MODE — Surfaces & Text

  static const Color darkBg        = Color(0xFF0D0F1A);
  static const Color darkBgAlt     = Color(0xFF13162A);
  static const Color darkSurface   = Color(0xFF181B2E);
  static const Color darkSurfaceRaised = Color(0xFF1E2240);
  static const Color darkSurfaceOverlay = Color(0xFF252847);
  static const Color darkBorder    = Color(0xFF252847);
  static const Color darkBorderStrong = Color(0xFF303558);
  static const Color darkDivider   = Color(0xFF1A1D35);
  static const Color darkSidebar   = Color(0xFF090A14);

  static const Color darkText1 = Color(0xFFF0F2FF); // Headings
  static const Color darkText2 = Color(0xFF9EA3C8); // Body
  static const Color darkText3 = Color(0xFF5A5F80); // Caption
  static const Color darkText4 = Color(0xFF363A5A); // Disabled


  // TRANSPARENT UTILITIES

  static const Color primaryOverlay12 = Color(0x1F1A56FF);
  static const Color primaryOverlay20 = Color(0x331A56FF);
  static const Color whiteOverlay10   = Color(0x1AFFFFFF);
  static const Color whiteOverlay20   = Color(0x33FFFFFF);
  static const Color blackOverlay30   = Color(0x4D000000);
}

/// Custom theme extension for EduConnect color tokens
// class AppThemeColors extends ThemeExtension<AppThemeColors> {
//   final Color surface;
//   final Color bgAlt;
//   final Color bg;
//   final Color border;
//   final Color borderStrong;
//   final Color divider;
//   final Color text1;
//   final Color text2;
//   final Color text3;

//   AppThemeColors({
//     required this.surface,
//     required this.bgAlt,
//     required this.bg,
//     required this.border,
//     required this.borderStrong,
//     required this.divider,
//     required this.text1,
//     required this.text2,
//     required this.text3,
//   });

//   static final AppThemeColors light = AppThemeColors(
//     surface: AppColors.lightSurface,
//     bgAlt: AppColors.lightBgAlt,
//     bg: AppColors.lightBg,
//     border: AppColors.lightBorder,
//     borderStrong: AppColors.lightBorderStrong,
//     divider: AppColors.lightDivider,
//     text1: AppColors.lightText1,
//     text2: AppColors.lightText2,
//     text3: AppColors.lightText3,
//   );

//   static final AppThemeColors dark = AppThemeColors(
//     surface: AppColors.darkSurface,
//     bgAlt: AppColors.darkBgAlt,
//     bg: AppColors.darkBg,
//     border: AppColors.darkBorder,
//     borderStrong: AppColors.darkBorderStrong,
//     divider: AppColors.darkDivider,
//     text1: AppColors.darkText1,
//     text2: AppColors.darkText2,
//     text3: AppColors.darkText3,
//   );

//   @override
//   AppThemeColors copyWith({
//     Color? surface,
//     Color? bgAlt,
//     Color? bg,
//     Color? border,
//     Color? borderStrong,
//     Color? divider,
//     Color? text1,
//     Color? text2,
//     Color? text3,
//   }) {
//     return AppThemeColors(
//       surface: surface ?? this.surface,
//       bgAlt: bgAlt ?? this.bgAlt,
//       bg: bg ?? this.bg,
//       border: border ?? this.border,
//       borderStrong: borderStrong ?? this.borderStrong,
//       divider: divider ?? this.divider,
//       text1: text1 ?? this.text1,
//       text2: text2 ?? this.text2,
//       text3: text3 ?? this.text3,
//     );
//   }

//   @override
//   AppThemeColors lerp(AppThemeColors? other, double t) {
//     if (other is! AppThemeColors) return this;
//     return AppThemeColors(
//       surface: Color.lerp(surface, other.surface, t) ?? surface,
//       bgAlt: Color.lerp(bgAlt, other.bgAlt, t) ?? bgAlt,
//       bg: Color.lerp(bg, other.bg, t) ?? bg,
//       border: Color.lerp(border, other.border, t) ?? border,
//       borderStrong: Color.lerp(borderStrong, other.borderStrong, t) ?? borderStrong,
//       divider: Color.lerp(divider, other.divider, t) ?? divider,
//       text1: Color.lerp(text1, other.text1, t) ?? text1,
//       text2: Color.lerp(text2, other.text2, t) ?? text2,
//       text3: Color.lerp(text3, other.text3, t) ?? text3,
//     );
//   }
// }
