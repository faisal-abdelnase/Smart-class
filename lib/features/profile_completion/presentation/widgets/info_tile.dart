import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';
import 'info_section.dart';

class InfoTile extends StatelessWidget {
  final InfoItem item;

  const InfoTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(item.icon, size: 20),
            const SizedBox(width: 10),
            Expanded(
              child: Text(item.title,
                  style: const TextStyle(color: Colors.grey)),
            ),
            Text(item.value),
          ],
        ),
        const Divider(height: 20, thickness: 1, color: AppColors.lightBorder),
      ],
    );
  }
}