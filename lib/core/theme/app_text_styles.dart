import 'package:flutter/material.dart';

/// EduConnect — Typography System
/// Three font families used across the app:
///   • Sora        → Display, headings, brand
///   • DM Sans     → Body, UI labels, buttons
///   • JetBrains Mono → Timers, scores, IDs, code
///
/// Add to pubspec.yaml:
///   google_fonts: ^6.1.0
///
/// Then in main.dart: no need to import individually —
/// AppTheme already wires these via textTheme.
class AppTypography {
  AppTypography._();

  static const String fontDisplay = 'Sora';
  static const String fontBody    = 'DM Sans';
  static const String fontMono    = 'JetBrains Mono';

  // ─────────────────────────────────────────────────────
  // DISPLAY / HERO (Sora)
  // ─────────────────────────────────────────────────────

  /// 48px · 800 · −1.5 tracking  →  App logo, splash hero
  static const TextStyle displayLarge = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 48,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.5,
    height: 1.0,
  );

  /// 36px · 800 · −1.2 tracking  →  Page hero titles
  static const TextStyle displayMedium = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 36,
    fontWeight: FontWeight.w800,
    letterSpacing: -1.2,
    height: 1.1,
  );

  /// 28px · 700 · −0.8 tracking  →  Section hero
  static const TextStyle displaySmall = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.8,
    height: 1.2,
  );

  // ─────────────────────────────────────────────────────
  // HEADINGS (Sora)
  // ─────────────────────────────────────────────────────

  /// 24px · 700  →  Screen titles, card headers
  static const TextStyle h1 = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 24,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.4,
    height: 1.25,
  );

  /// 20px · 700  →  Dialog titles, section headers
  static const TextStyle h2 = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 20,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.3,
    height: 1.3,
  );

  /// 17px · 700  →  Card titles, list headers
  static const TextStyle h3 = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 17,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.2,
    height: 1.35,
  );

  /// 15px · 700  →  Sub-section titles
  static const TextStyle h4 = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 15,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  /// 13px · 700  →  Small card titles
  static const TextStyle h5 = TextStyle(
    fontFamily: fontDisplay,
    fontSize: 13,
    fontWeight: FontWeight.w700,
    height: 1.4,
  );

  // ─────────────────────────────────────────────────────
  // BODY (DM Sans)
  // ─────────────────────────────────────────────────────

  /// 16px · 400  →  Long-form body text
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontBody,
    fontSize: 16,
    fontWeight: FontWeight.w400,
    height: 1.6,
  );

  /// 14px · 400  →  Default body text
  static const TextStyle bodyMedium = TextStyle(
    fontFamily: fontBody,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    height: 1.55,
  );

  /// 13px · 400  →  Secondary body text
  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontBody,
    fontSize: 13,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  /// 12px · 400  →  Captions, meta info
  static const TextStyle bodyXSmall = TextStyle(
    fontFamily: fontBody,
    fontSize: 12,
    fontWeight: FontWeight.w400,
    height: 1.5,
  );

  // ─────────────────────────────────────────────────────
  // LABELS / UI (DM Sans)
  // ─────────────────────────────────────────────────────

  /// 14px · 600  →  Button text, tab labels
  static const TextStyle labelLarge = TextStyle(
    fontFamily: fontBody,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  /// 12px · 600  →  Small buttons, chips
  static const TextStyle labelMedium = TextStyle(
    fontFamily: fontBody,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  /// 11px · 600  →  Form labels
  static const TextStyle labelSmall = TextStyle(
    fontFamily: fontBody,
    fontSize: 11,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  /// 10px · 700 · uppercase  →  Badges, status pills
  static const TextStyle badge = TextStyle(
    fontFamily: fontBody,
    fontSize: 10,
    fontWeight: FontWeight.w700,
    letterSpacing: 0.5,
  );

  /// 9px · 700 · uppercase  →  Tiny labels, section separators
  static const TextStyle micro = TextStyle(
    fontFamily: fontBody,
    fontSize: 9,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
  );

  // ─────────────────────────────────────────────────────
  // MONO (JetBrains Mono)
  // ─────────────────────────────────────────────────────

  /// 28px · 700 · 2.0 tracking  →  Exam countdown timer
  static const TextStyle timerLarge = TextStyle(
    fontFamily: fontMono,
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: 2.0,
  );

  /// 22px · 700 · 1.5 tracking  →  Score display
  static const TextStyle scoreLarge = TextStyle(
    fontFamily: fontMono,
    fontSize: 22,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.5,
  );

  /// 16px · 700  →  Medium numeric data
  static const TextStyle scoreMedium = TextStyle(
    fontFamily: fontMono,
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  /// 13px · 600  →  Class codes, IDs
  static const TextStyle codeLabel = TextStyle(
    fontFamily: fontMono,
    fontSize: 13,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.3,
  );

  /// 11px · 500  →  Small mono labels
  static const TextStyle codeSmall = TextStyle(
    fontFamily: fontMono,
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );

  /// 9px · 600 · uppercase · 2px tracking  →  Section labels, timestamps
  static const TextStyle monoMicro = TextStyle(
    fontFamily: fontMono,
    fontSize: 9,
    fontWeight: FontWeight.w600,
    letterSpacing: 2.0,
  );
}
