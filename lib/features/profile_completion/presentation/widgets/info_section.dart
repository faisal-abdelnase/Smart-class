import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import 'info_tile.dart';


class InfoItem {
  final IconData icon;
  final String title;
  final String value;

  const InfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });
}

class InfoSection extends StatelessWidget {
  final String title;
  final List<InfoItem> items;
  final VoidCallback? onEdit;

  const InfoSection({
    super.key,
    required this.title,
    required this.items,
    this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1,color: isDarkMode ? AppColors.darkBorderStrong : AppColors.lightBorder),
        color: Colors.white10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              if (onEdit != null)
                TextButton(onPressed: onEdit, child: const Text("Edit")),
            ],
          ),

          const SizedBox(height: 10),

          ...items.map((e) => InfoTile(item: e)),
        ],
      ),
    );
  }
}
