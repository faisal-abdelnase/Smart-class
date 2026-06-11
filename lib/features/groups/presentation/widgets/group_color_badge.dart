import 'package:flutter/material.dart';

import '../../data/models/group_model.dart';

class GroupColorBadge extends StatelessWidget {
  const GroupColorBadge({required this.group, super.key});

  final GroupModel group;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: group.color.withValues(alpha: 0.14),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Icon(group.icon, color: group.color, size: 28),
      ),
    );
  }
}
