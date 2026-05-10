import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_class/core/localization/locale_cubit.dart';

Widget buildLocalLang(BuildContext context) {

    return PopupMenuButton<String>(
          icon: const Icon(Icons.language),
          onSelected: (value) {
            context.read<LocaleCubit>().changeLanguage(value);
          },
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'en', child: Text('English')),
            PopupMenuItem(value: 'ar', child: Text('العربية')),
          ],
    );
  }