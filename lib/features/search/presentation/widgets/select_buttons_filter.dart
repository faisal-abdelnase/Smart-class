import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/responsive_text.dart';

import '../../../../core/theme/app_colors.dart';

class SelectButtonsFilter extends StatefulWidget {
  const SelectButtonsFilter({super.key});

  @override
  State<SelectButtonsFilter> createState() => _SelectButtonsFilterState();
}

class _SelectButtonsFilterState extends State<SelectButtonsFilter> {

  int selectedIndex = 0;

  List<String> options = [
    "All",
    "Users",
    "Groups",
    "Exams",
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        options.length,
        (index) {
          final bool isSelected = selectedIndex == index;

          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.lightSurface,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : AppColors.lightBorder,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? AppColors.primary.withValues(alpha: 0.25)
                          : Colors.black.withValues(alpha: 0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: AppText(
                  options[index],
                  baseFontSize: 12,
                  style: TextStyle(
                    
                    fontWeight: FontWeight.w600,
                    color: isSelected
                        ? Colors.white
                        : AppColors.lightText1,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}