import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_colors.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    super.key,
    required this.name,
    required this.role,
    this.imagePath,
  });

  final String name;
  final String role;
  final String? imagePath;

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
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: imagePath != null && imagePath!.isNotEmpty
                ? AssetImage(imagePath!)
                : null,
            child: imagePath == null || imagePath!.isEmpty
                ? const Icon(Icons.person)
                : null,
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text(role, style: const TextStyle(color: Colors.blue)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
