import 'package:flutter/material.dart';
import 'package:smart_class/core/theme/app_theme_extensions.dart';

import '../../../../core/theme/app_text_styles.dart';

class RecentSearchSection extends StatefulWidget {
  const RecentSearchSection({
    super.key,
  });

  @override
  State<RecentSearchSection> createState() => _RecentSearchSectionState();
}

class _RecentSearchSectionState extends State<RecentSearchSection> {

  final List<String> recentSearches = [
      'Faisal Instructor',
      'Math Groubs',
      'Science Courses',
    ];
  @override
  Widget build(BuildContext context) {
    final t = Theme.of(context).extension<AppThemeColors>()!;

    return Column(
      children:
          List.generate(recentSearches.length, (index) {
        return Container(
          margin: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: t.primaryTint,
            borderRadius: BorderRadius.circular(14),
          ),

          child: ListTile(
            leading: Icon(Icons.history, color: t.text3),
            title: Text(recentSearches[index], style: AppTypography.h5.copyWith(color: t.text1)),
            trailing: IconButton(
                onPressed: () {
                  recentSearches.removeAt(index);
                  setState(() {});
                },
                icon: Icon(Icons.clear, color: t.text3)),
          ),
        );
      }),

    );
  }
}