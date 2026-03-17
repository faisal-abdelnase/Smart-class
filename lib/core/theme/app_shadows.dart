import 'package:flutter/material.dart';


/// EduConnect — Shadow System
class AppShadows {
  AppShadows._();


  // NEUTRAL SHADOWS (Light mode)

  static const List<BoxShadow> sm = [
    BoxShadow(
      color: Color(0x0F0D0F1A),
      offset: Offset(0, 1),
      blurRadius: 3,
    ),
    BoxShadow(
      color: Color(0x0A0D0F1A),
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  static const List<BoxShadow> md = [
    BoxShadow(
      color: Color(0x140D0F1A),
      offset: Offset(0, 4),
      blurRadius: 12,
    ),
    BoxShadow(
      color: Color(0x0A0D0F1A),
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
  ];

  static const List<BoxShadow> lg = [
    BoxShadow(
      color: Color(0x1E0D0F1A),
      offset: Offset(0, 12),
      blurRadius: 32,
    ),
    BoxShadow(
      color: Color(0x0F0D0F1A),
      offset: Offset(0, 4),
      blurRadius: 8,
    ),
  ];

  static const List<BoxShadow> xl = [
    BoxShadow(
      color: Color(0x290D0F1A),
      offset: Offset(0, 24),
      blurRadius: 56,
    ),
    BoxShadow(
      color: Color(0x140D0F1A),
      offset: Offset(0, 8),
      blurRadius: 16,
    ),
  ];


  // NEUTRAL SHADOWS (Dark mode)

  static const List<BoxShadow> smDark = [
    BoxShadow(
      color: Color(0x4D000000),
      offset: Offset(0, 1),
      blurRadius: 3,
    ),
    BoxShadow(
      color: Color(0x33000000),
      offset: Offset(0, 1),
      blurRadius: 2,
    ),
  ];

  static const List<BoxShadow> mdDark = [
    BoxShadow(
      color: Color(0x66000000),
      offset: Offset(0, 4),
      blurRadius: 12,
    ),
    BoxShadow(
      color: Color(0x33000000),
      offset: Offset(0, 2),
      blurRadius: 4,
    ),
  ];

  static const List<BoxShadow> lgDark = [
    BoxShadow(
      color: Color(0x80000000),
      offset: Offset(0, 12),
      blurRadius: 32,
    ),
    BoxShadow(
      color: Color(0x40000000),
      offset: Offset(0, 4),
      blurRadius: 8,
    ),
  ];


  // BRAND-COLORED SHADOWS (for floating action buttons etc.)

  static const List<BoxShadow> primary = [
    BoxShadow(
      color: Color(0x471A56FF),
      offset: Offset(0, 8),
      blurRadius: 24,
    ),
  ];

  static const List<BoxShadow> accent = [
    BoxShadow(
      color: Color(0x47FF6B2B),
      offset: Offset(0, 8),
      blurRadius: 24,
    ),
  ];

  static const List<BoxShadow> green = [
    BoxShadow(
      color: Color(0x4722C55E),
      offset: Offset(0, 8),
      blurRadius: 24,
    ),
  ];

  static const List<BoxShadow> purple = [
    BoxShadow(
      color: Color(0x478B5CF6),
      offset: Offset(0, 8),
      blurRadius: 24,
    ),
  ];

  // CARD SHADOW (adaptive helper)

  static List<BoxShadow> card(bool isDark) => isDark ? smDark : sm;
  static List<BoxShadow> cardRaised(bool isDark) => isDark ? mdDark : md;
}
