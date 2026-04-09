import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_class/firebase_options.dart';
import 'core/di/service_locator.dart';
import 'core/localization/app_localizations_delegate.dart';
import 'core/localization/locale_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/services/hive_services.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit.dart';
import 'features/auth/presentation/cubit/auth_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  await HiveService.init();
  await init();

  runApp(const SmartClass());
}

class SmartClass extends StatelessWidget {
  const SmartClass({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<LocaleCubit>()),
        BlocProvider(create: (_) => sl<ThemeCubit>()),
        BlocProvider(create: (_) => sl<AuthCubit>()),
      ],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              return MaterialApp(
                theme: AppTheme.light,
                darkTheme: AppTheme.dark,
                themeMode: themeMode,
                title: "Smart Class",
                debugShowCheckedModeBanner: false,
                onGenerateRoute: AppRouter.generateRoute,
                initialRoute: Routes.splashPage,

                locale: locale,
                supportedLocales: const [Locale('en'), Locale('ar')],

                localeResolutionCallback: (deviceLocale, supportedLocales) {
                  String? savedLang = HiveService.box.get('lang');

                  if (savedLang != null) {
                    return Locale(savedLang);
                  }

                  for (var locale in supportedLocales) {
                    if (locale.languageCode == deviceLocale!.languageCode) {
                      return deviceLocale;
                    }
                  }

                  return const Locale('en');
                },

                localizationsDelegates: const [
                  AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
              );
            },
          );
        },
      ),
    );
  }
}