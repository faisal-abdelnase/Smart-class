import 'package:flutter/material.dart';
import 'package:smart_class/core/responsive/responsive_text.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';

import '../../../../core/utils/extensions.dart';

class SelectButtonsFilter extends StatefulWidget {
  const SelectButtonsFilter({super.key});

  @override
  State<SelectButtonsFilter> createState() => _SelectButtonsFilterState();
}

class _SelectButtonsFilterState extends State<SelectButtonsFilter> {

  int selectedIndex = 0;

  List<String> options = [];

  @override
  Widget build(BuildContext context) {
    // localized options
    final localizedOptions = [
      context.tr("all"),
      context.tr("users"),
      context.tr("groups_label"),
      context.tr("exams"),
    ];
    final optionsToShow = localizedOptions;
    final theme = Theme.of(context);
    final t = theme.extension<AppThemeColors>()!;
    final cs = theme.colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        optionsToShow.length,
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
                  color: isSelected ? cs.primary : t.surface,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                    color: isSelected ? cs.primary : t.border,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: isSelected
                          ? cs.primary.withOpacity(0.25)
                          : Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: AppText(
                  optionsToShow[index],
                  baseFontSize: 12,
                  style: TextStyle(
                    
                    fontWeight: FontWeight.w600,
                    color: isSelected ? cs.onPrimary : t.text1,
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