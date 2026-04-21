import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? hint;
  final IconData? icon;
  final TextEditingController? controller;
  final int? maxLines;
  final TextInputType? keyboardType;

  const CustomTextField({super.key, 
    required this.label,
    this.hint,
    this.icon, this.controller, this.maxLines, this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    
    final labelColor = isDarkMode ? AppColors.darkText1 : AppColors.lightText1;
    final fillColor = isDarkMode ? AppColors.darkBorder : AppColors.lightBgAlt;
    final hintColor = isDarkMode ? AppColors.darkText3 : AppColors.lightText3;
    final iconColor = isDarkMode ? AppColors.darkText2 : AppColors.lightText2;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: labelColor, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: hintColor),
            prefixIcon: icon != null ? Icon(icon, color: iconColor) : null,
            filled: true,
            fillColor: fillColor,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}
