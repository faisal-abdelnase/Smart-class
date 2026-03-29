import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/localization/app_localizations.dart';
import '../../../../core/localization/locale_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate("login")),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
            onPressed: () {
              context.read<LocaleCubit>().changeLanguage('ar');
            },
            child: Text("AR"),
          ),

          ElevatedButton(
            onPressed: () {
              context.read<LocaleCubit>().changeLanguage('en');
            },
            child: Text("EN"),
          ),
          ],
        ),
      ),
    );
  }
}