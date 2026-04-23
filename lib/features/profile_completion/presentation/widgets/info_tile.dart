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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(item.icon, size: 20),
            const SizedBox(width: 10),
            Expanded(
              flex: 2,
              child: Text(item.title,
                  style: const TextStyle(color: Colors.grey)),
            ),
            Expanded(
              flex: 3,
              child: Text(
                item.value,
                textAlign: TextAlign.end,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ],
        ),
        const Divider(height: 20, thickness: 1, color: AppColors.lightBorder),
      ],
    );
  }
}