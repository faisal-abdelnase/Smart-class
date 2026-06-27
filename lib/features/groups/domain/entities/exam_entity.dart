import 'package:flutter/material.dart';

class ExamInfo {
  const ExamInfo({
    required this.titleKey,
    required this.subtitleKey,
    required this.questions,
    required this.minutes,
    required this.statusLabelKey,
    required this.statusColor,
  });

  final String titleKey;
  final String subtitleKey;
  final int questions;
  final int minutes;
  final String statusLabelKey;
  final Color statusColor;
}