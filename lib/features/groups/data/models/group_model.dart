import 'package:flutter/material.dart';

class GroupModel {
  const GroupModel({
    required this.name,
    required this.description,
    required this.studentCount,
    required this.color,
    required this.icon,
  });

  final String name;
  final String description;
  final int studentCount;
  final Color color;
  final IconData icon;
}