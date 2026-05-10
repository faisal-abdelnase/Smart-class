import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ActionButton({super.key, 
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(12),
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 18,
            color: const Color(0xff667085),
          ),
      
          const SizedBox(width: 8),
      
          Text(
            label,
            style: const TextStyle(
              color: Color(0xff667085),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}