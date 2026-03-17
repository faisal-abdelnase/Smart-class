import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_class/core/theme/app_colors.dart';
import 'package:smart_class/core/theme/app_dimension.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';


/// ─────────────────────────────────────────────────────────
/// EduConnect — AppTheme
///
/// Full Material 3 ThemeData for light + dark modes.
/// Includes custom AppThemeColors extension for EduConnect
/// surface, text, and tint tokens.
///
/// ── Setup in MaterialApp ─────────────────────────────────
///   MaterialApp(
///     theme:      AppTheme.light,
///     darkTheme:  AppTheme.dark,
///     themeMode:  ThemeMode.system, // or .light / .dark
///   )
///
/// ── Reading tokens in widgets ────────────────────────────
///   // Standard Material tokens
///   Theme.of(context).colorScheme.primary
///
///   // EduConnect custom tokens
///   final t = Theme.of(context).extension<AppThemeColors>()!;
///   Container(color: t.surface)
///   Text('Hello', style: TextStyle(color: t.text1))
/// ─────────────────────────────────────────────────────────
class AppTheme {
  AppTheme._();

  static ThemeData get light => _build(isDark: false);
  static ThemeData get dark  => _build(isDark: true);

  // ═══════════════════════════════════════════════════
  // BUILDER
  // ═══════════════════════════════════════════════════
  static ThemeData _build({required bool isDark}) {
    final c = isDark ? _DarkPalette() : _LightPalette();

    final colorScheme = ColorScheme(
      brightness:    isDark ? Brightness.dark : Brightness.light,
      // Primary — Blue (Instructor)
      primary:              AppColors.primary,
      onPrimary:            Colors.white,
      primaryContainer:     isDark ? const Color(0x261A56FF) : AppColors.primary50,
      onPrimaryContainer:   isDark ? AppColors.primaryLight : AppColors.primaryDark,
      // Secondary — Orange (Accent)
      secondary:            AppColors.accent,
      onSecondary:          Colors.white,
      secondaryContainer:   isDark ? const Color(0x26FF6B2B) : AppColors.accent50,
      onSecondaryContainer: isDark ? AppColors.accentLight : AppColors.accentDark,
      // Tertiary — Purple (Parent)
      tertiary:             AppColors.purple,
      onTertiary:           Colors.white,
      tertiaryContainer:    isDark ? const Color(0x268B5CF6) : AppColors.purple50,
      onTertiaryContainer:  isDark ? AppColors.purpleLight : AppColors.purpleDark,
      // Error
      error:                AppColors.red,
      onError:              Colors.white,
      errorContainer:       isDark ? const Color(0x1FEF4444) : AppColors.red50,
      onErrorContainer:     isDark ? AppColors.redLight : AppColors.redDark,
      // Surfaces
      surface:              c.surface,
      onSurface:            c.text1,
      surfaceContainerHighest: c.bgAlt,
      surfaceContainerHigh:    c.bgAlt,
      surfaceContainer:        c.surface,
      surfaceContainerLow:     c.bg,
      surfaceContainerLowest:  c.bg,
      onSurfaceVariant:     c.text2,
      // Outline
      outline:        c.border,
      outlineVariant: c.borderStrong,
      // Inverse
      inverseSurface:    isDark ? AppColors.lightSurface : AppColors.darkSurface,
      onInverseSurface:  isDark ? AppColors.lightText1   : AppColors.darkText1,
      inversePrimary:    AppColors.primaryLight,
      shadow: Colors.black,
      scrim:  Colors.black,
    );

    return ThemeData(
      useMaterial3:            true,
      colorScheme:             colorScheme,
      scaffoldBackgroundColor: c.bg,
      brightness:              isDark ? Brightness.dark : Brightness.light,

      // Custom EduConnect extension
      extensions: [isDark ? AppThemeColors.dark : AppThemeColors.light],

      // ── Typography ──────────────────────────────────
      fontFamily: AppTypography.fontBody,
      textTheme:  _buildTextTheme(c.text1, c.text2, c.text3),

      // ── AppBar ──────────────────────────────────────
      appBarTheme: AppBarTheme(
        backgroundColor:        c.surface,
        foregroundColor:        c.text1,
        elevation:              0,
        scrolledUnderElevation: 0.5,
        centerTitle:            false,
        titleTextStyle: AppTypography.h3.copyWith(color: c.text1),
        iconTheme:        IconThemeData(color: c.text2, size: AppDimensions.iconMD),
        actionsIconTheme: IconThemeData(color: c.text2, size: AppDimensions.iconMD),
        shape: Border(bottom: BorderSide(color: c.border)),
        systemOverlayStyle: isDark
            ? SystemUiOverlayStyle(
                statusBarBrightness:      Brightness.dark,
                statusBarIconBrightness:  Brightness.light,
                systemNavigationBarColor: c.surface,
              )
            : SystemUiOverlayStyle(
                statusBarBrightness:      Brightness.light,
                statusBarIconBrightness:  Brightness.dark,
                systemNavigationBarColor: c.surface,
              ),
      ),

      // ── Bottom Navigation Bar ───────────────────────
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:     c.surface,
        selectedItemColor:   AppColors.primary,
        unselectedItemColor: c.text3,
        selectedLabelStyle:   AppTypography.micro.copyWith(color: AppColors.primary),
        unselectedLabelStyle: AppTypography.micro.copyWith(color: c.text3),
        showUnselectedLabels: true,
        type:      BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      // ── NavigationBar (M3) ──────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor:  c.surface,
        indicatorColor:   isDark ? const Color(0x261A56FF) : AppColors.primary50,
        elevation:        0,
        height:           AppDimensions.bottomNavHeight,
        labelBehavior:    NavigationDestinationLabelBehavior.alwaysShow,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final sel = states.contains(WidgetState.selected);
          return IconThemeData(
            color: sel ? AppColors.primary : c.text3,
            size:  AppDimensions.iconMD,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final sel = states.contains(WidgetState.selected);
          return AppTypography.micro.copyWith(
            color: sel ? AppColors.primary : c.text3,
          );
        }),
      ),

      // ── Card ────────────────────────────────────────
      cardTheme: CardThemeData(
        color:     c.surface,
        elevation: 0,
        margin:    EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.radiusLG,
          side: BorderSide(color: c.border),
        ),
      ),

      // ── ElevatedButton ──────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor:        AppColors.primary,
          foregroundColor:        Colors.white,
          disabledBackgroundColor: c.border,
          disabledForegroundColor: c.text3,
          elevation:    0,
          shadowColor:  Colors.transparent,
          minimumSize:  const Size(0, AppDimensions.buttonHeightMD),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.sp5,
            vertical:   AppDimensions.sp3,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppDimensions.radiusMD,
          ),
          textStyle: AppTypography.labelLarge,
        ),
      ),

      // ── OutlinedButton ──────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: c.text2,
          side:    BorderSide(color: c.border, width: 1.5),
          minimumSize: const Size(0, AppDimensions.buttonHeightMD),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.sp5,
            vertical:   AppDimensions.sp3,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppDimensions.radiusMD,
          ),
          textStyle: AppTypography.labelLarge,
        ),
      ),

      // ── TextButton ──────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: AppColors.primary,
          textStyle: AppTypography.labelMedium,
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.sp3,
            vertical:   AppDimensions.sp2,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppDimensions.radiusSM,
          ),
        ),
      ),

      // ── FilledButton ────────────────────────────────
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          elevation:   0,
          shadowColor: Colors.transparent,
          minimumSize: const Size(0, AppDimensions.buttonHeightMD),
          padding: const EdgeInsets.symmetric(
            horizontal: AppDimensions.sp5,
            vertical:   AppDimensions.sp3,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppDimensions.radiusMD,
          ),
          textStyle: AppTypography.labelLarge,
        ),
      ),

      // ── Input Decoration ────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled:      true,
        fillColor:   c.bgAlt,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.sp4,
          vertical:   AppDimensions.sp3,
        ),
        labelStyle:  AppTypography.labelSmall.copyWith(color: c.text2),
        hintStyle:   AppTypography.bodySmall.copyWith(color: c.text3),
        helperStyle: AppTypography.bodyXSmall.copyWith(color: c.text3),
        errorStyle:  AppTypography.bodyXSmall.copyWith(color: AppColors.red),
        floatingLabelStyle: AppTypography.labelSmall.copyWith(
          color: AppColors.primary,
        ),
        border: OutlineInputBorder(
          borderRadius: AppDimensions.radiusMD,
          borderSide: BorderSide(color: c.border, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppDimensions.radiusMD,
          borderSide: BorderSide(color: c.border, width: 1.5),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppDimensions.radiusMD,
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppDimensions.radiusMD,
          borderSide: BorderSide(color: AppColors.red, width: 1.5),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: AppDimensions.radiusMD,
          borderSide: BorderSide(color: AppColors.red, width: 2),
        ),
        prefixIconColor: c.text3,
        suffixIconColor: c.text3,
      ),

      // ── Chip ────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor: c.bgAlt,
        selectedColor:   isDark ? const Color(0x261A56FF) : AppColors.primary50,
        disabledColor:   c.border,
        labelStyle: AppTypography.labelSmall.copyWith(color: c.text2),
        secondaryLabelStyle: AppTypography.labelSmall.copyWith(
          color: AppColors.primary,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.sp3,
          vertical:   AppDimensions.sp1,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: AppDimensions.radiusFull,
        ),
        side:          BorderSide(color: c.border),
        elevation:     0,
        showCheckmark: false,
      ),

      // ── Dialog ──────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: c.surface,
        elevation:       0,
        shape: const RoundedRectangleBorder(
          borderRadius: AppDimensions.radius2XL,
        ),
        titleTextStyle:   AppTypography.h2.copyWith(color: c.text1),
        contentTextStyle: AppTypography.bodyMedium.copyWith(color: c.text2),
      ),

      // ── BottomSheet ─────────────────────────────────
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor:      c.surface,
        modalBackgroundColor: c.surface,
        elevation:            0,
        modalElevation:       0,
        dragHandleColor: c.border,
        dragHandleSize:  const Size(40, 4),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppDimensions.r2XL),
          ),
        ),
      ),

      // ── SnackBar ────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark
            ? AppColors.darkSurfaceRaised
            : AppColors.lightText1,
        contentTextStyle: AppTypography.bodySmall.copyWith(color: Colors.white),
        actionTextColor:  AppColors.primaryLight,
        behavior:         SnackBarBehavior.floating,
        elevation:        0,
        shape: const RoundedRectangleBorder(
          borderRadius: AppDimensions.radiusMD,
        ),
      ),

      // ── TabBar ──────────────────────────────────────
      tabBarTheme: TabBarThemeData(
        labelColor:          AppColors.primary,
        unselectedLabelColor: c.text3,
        indicatorColor:      AppColors.primary,
        indicatorSize:       TabBarIndicatorSize.tab,
        labelStyle:          AppTypography.labelMedium,
        unselectedLabelStyle: AppTypography.labelMedium,
        dividerColor:        c.border,
        tabAlignment:        TabAlignment.start,
      ),

      // ── Divider ─────────────────────────────────────
      dividerTheme: DividerThemeData(
        color: c.divider, thickness: 1, space: 1,
      ),

      // ── ListTile ────────────────────────────────────
      listTileTheme: ListTileThemeData(
        tileColor:         Colors.transparent,
        selectedTileColor: isDark ? const Color(0x261A56FF) : AppColors.primary50,
        selectedColor:     AppColors.primary,
        iconColor:         c.text3,
        textColor:         c.text1,
        titleTextStyle: AppTypography.bodySmall.copyWith(
          color: c.text1,
          fontWeight: FontWeight.w600,
        ),
        subtitleTextStyle: AppTypography.bodyXSmall.copyWith(color: c.text3),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.sp4,
          vertical:   AppDimensions.sp1,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: AppDimensions.radiusMD,
        ),
      ),

      // ── Switch ──────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? Colors.white : c.text3),
        trackColor: WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? AppColors.primary : c.border),
        trackOutlineColor: WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? AppColors.primary : c.border),
      ),

      // ── Checkbox ────────────────────────────────────
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? AppColors.primary : Colors.transparent),
        checkColor: WidgetStateProperty.all(Colors.white),
        side: WidgetStateBorderSide.resolveWith((s) =>
            s.contains(WidgetState.selected)
                ? const BorderSide(color: AppColors.primary, width: 2)
                : BorderSide(color: c.border, width: 1.5)),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),

      // ── Radio ───────────────────────────────────────
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((s) =>
            s.contains(WidgetState.selected) ? AppColors.primary : c.text3),
      ),

      // ── Progress Indicator ──────────────────────────
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color:              AppColors.primary,
        linearTrackColor:   c.border,
        circularTrackColor: c.border,
        linearMinHeight:    6,
        borderRadius:       AppDimensions.radiusFull,
      ),

      // ── Slider ──────────────────────────────────────
      sliderTheme: SliderThemeData(
        activeTrackColor:    AppColors.primary,
        inactiveTrackColor:  c.border,
        thumbColor:          AppColors.primary,
        overlayColor:        AppColors.primaryOverlay12,
        valueIndicatorColor: AppColors.primary,
        trackHeight:         4,
      ),

      // ── Tooltip ─────────────────────────────────────
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: isDark ? AppColors.darkSurfaceRaised : AppColors.lightText1,
          borderRadius: AppDimensions.radiusSM,
        ),
        textStyle: AppTypography.bodyXSmall.copyWith(color: Colors.white),
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.sp3,
          vertical:   AppDimensions.sp2,
        ),
      ),

      // ── FAB ─────────────────────────────────────────
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.accent,
        foregroundColor: Colors.white,
        elevation:       0,
        focusElevation:  0,
        hoverElevation:  0,
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.radiusLG,
        ),
      ),

      // ── PopupMenu ───────────────────────────────────
      popupMenuTheme: PopupMenuThemeData(
        color:     c.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: AppDimensions.radiusMD,
          side: BorderSide(color: c.border),
        ),
        textStyle: AppTypography.bodySmall.copyWith(color: c.text1),
      ),

      // ── Icons ───────────────────────────────────────
      iconTheme: IconThemeData(color: c.text2, size: AppDimensions.iconMD),
      primaryIconTheme: const IconThemeData(
        color: AppColors.primary,
        size:  AppDimensions.iconMD,
      ),

      // ── Text Selection ──────────────────────────────
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor:          AppColors.primary,
        selectionColor:       AppColors.primaryOverlay20,
        selectionHandleColor: AppColors.primary,
      ),
    );
  }

  // ─────────────────────────────────────────────────────
  // TEXT THEME
  // ─────────────────────────────────────────────────────
  static TextTheme _buildTextTheme(Color t1, Color t2, Color t3) => TextTheme(
    displayLarge:   AppTypography.displayLarge.copyWith(color: t1),
    displayMedium:  AppTypography.displayMedium.copyWith(color: t1),
    displaySmall:   AppTypography.displaySmall.copyWith(color: t1),
    headlineLarge:  AppTypography.h1.copyWith(color: t1),
    headlineMedium: AppTypography.h2.copyWith(color: t1),
    headlineSmall:  AppTypography.h3.copyWith(color: t1),
    titleLarge:     AppTypography.h4.copyWith(color: t1),
    titleMedium:    AppTypography.h5.copyWith(color: t1),
    titleSmall:     AppTypography.labelLarge.copyWith(color: t1),
    bodyLarge:      AppTypography.bodyLarge.copyWith(color: t1),
    bodyMedium:     AppTypography.bodyMedium.copyWith(color: t2),
    bodySmall:      AppTypography.bodySmall.copyWith(color: t2),
    labelLarge:     AppTypography.labelLarge.copyWith(color: t1),
    labelMedium:    AppTypography.labelMedium.copyWith(color: t2),
    labelSmall:     AppTypography.labelSmall.copyWith(color: t3),
  );
}

// ═══════════════════════════════════════════════════════
// INTERNAL PALETTE HELPERS
// ═══════════════════════════════════════════════════════
abstract class _Palette {
  Color get bg;
  Color get bgAlt;
  Color get surface;
  Color get border;
  Color get borderStrong;
  Color get divider;
  Color get text1;
  Color get text2;
  Color get text3;
}

class _LightPalette extends _Palette {
  @override final bg           = AppColors.lightBg;
  @override final bgAlt        = AppColors.lightBgAlt;
  @override final surface      = AppColors.lightSurface;
  @override final border       = AppColors.lightBorder;
  @override final borderStrong = AppColors.lightBorderStrong;
  @override final divider      = AppColors.lightDivider;
  @override final text1        = AppColors.lightText1;
  @override final text2        = AppColors.lightText2;
  @override final text3        = AppColors.lightText3;
}

class _DarkPalette extends _Palette {
  @override final bg           = AppColors.darkBg;
  @override final bgAlt        = AppColors.darkBgAlt;
  @override final surface      = AppColors.darkSurface;
  @override final border       = AppColors.darkBorder;
  @override final borderStrong = AppColors.darkBorderStrong;
  @override final divider      = AppColors.darkDivider;
  @override final text1        = AppColors.darkText1;
  @override final text2        = AppColors.darkText2;
  @override final text3        = AppColors.darkText3;
}
