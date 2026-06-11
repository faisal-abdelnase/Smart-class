import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_colors.dart';
import 'package:smart_class/core/theme/app_text_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    this.hintText =
        'Search for courses, instructors, groups...',
    this.width = 360,
    this.onChanged,
  });

  final String hintText;
  final double width;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,

      child: TextField(
        onChanged: onChanged,

        style: AppTypography.bodyMedium,

        decoration: InputDecoration(

          hintText: hintText,

          hintStyle:
              AppTypography.bodyMedium.copyWith(
            color: AppColors.lightText3,
          ),

          prefixIcon: Padding(
            padding: const EdgeInsets.only(
              left: 12,
              right: 8,
            ),

            child: Icon(
              Icons.search_rounded,
              color: AppColors.primary,
              size: 22,
            ),
          ),

          prefixIconConstraints:
              const BoxConstraints(
            minWidth: 50,
          ),
          filled: true,
          fillColor: AppColors.primary50,

          contentPadding:
              const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),


          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(18),

            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(18),

            borderSide: BorderSide(
              color: AppColors.primary
                  .withValues(alpha: 0.08),
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(18),

            borderSide: BorderSide(
              color: AppColors.primary,
              width: 1.4,
            ),
          ),

          /// Shadow-like effect
          isDense: true,
        ),
      ),
    );
  }
}