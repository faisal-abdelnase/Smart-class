import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theme/app_theme_extensions.dart';
import '../../../../core/theme/theme_cubit.dart';

Widget buildThemeToggle(AppThemeColors t, BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: context.read<ThemeCubit>().toggleTheme,
      child: Row(
        children: [
          Icon(
            isDark ? Icons.light_mode : Icons.dark_mode,
            color: t.text2,
          ),
          const SizedBox(width: 4),
          Text(
            isDark ? 'Light' : 'Dark',
            style: TextStyle(color: t.text2),
          ),
        ],
      ),
    );
  }