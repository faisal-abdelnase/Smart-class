import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_colors.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

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
          const CircleAvatar(radius: 28, child: Icon(Icons.person)),

          const SizedBox(width: 12),

          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sarah Johnson",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("Instructor", style: TextStyle(color: Colors.blue)),
              ],
            ),
          ),

          TextButton(onPressed: () {}, child: const Text("Edit"))
        ],
      ),
    );
  }
}