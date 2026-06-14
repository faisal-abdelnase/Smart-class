
import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';

class MiniStatCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const MiniStatCard({super.key, 
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final t = theme.extension<AppThemeColors>()!;
    final backgroundOpacity = theme.brightness == Brightness.dark ? 0.16 : 0.08;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(backgroundOpacity),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: t.text2,
              fontSize: 13,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            value,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
