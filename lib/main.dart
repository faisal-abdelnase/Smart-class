import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/di/service_locator.dart';
import 'core/localization/app_localizations_delegate.dart';
import 'core/localization/locale_cubit.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';
import 'core/services/hive_services.dart';
import 'core/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await HiveService.init();
  await init();

  runApp(const SmartClass());
}

class SmartClass extends StatefulWidget {
  const SmartClass({super.key});

  @override
  State<SmartClass> createState() => _SmartClassState();
}

class _SmartClassState extends State<SmartClass> {
  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    ThemeMode _themeMode = ThemeMode.system;
    // ignore: unused_element
    void toggleTheme() => setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => sl<LocaleCubit>())],
      child: BlocBuilder<LocaleCubit, Locale>(
        builder: (context, locale) {
          return MaterialApp(
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: _themeMode,
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
      ),
    );
  }
}
