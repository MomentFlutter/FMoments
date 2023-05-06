import "package:dls/theme/app_theme.dart";
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "utilities/system_provider.dart";
import "package:localization/app_localization.dart";
import "package:provider/provider.dart";

import "navigation/routes.dart";

class MyApp extends StatelessWidget {
  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => SystemProvider(),
        builder: (context, _) {
          final systemProvider = Provider.of<SystemProvider>(context);
          return MaterialApp.router(
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            title: "Flutter Starter",
            themeMode: systemProvider.themeMode,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            locale: systemProvider.locale,
            supportedLocales: [
              Locale("en", "US"),
              Locale("hi", "IN"),
              Locale("fr", "FR")
            ],
            localizationsDelegates: [
              AppLocalization.delegate(filepath: "assets/lang"),
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var supportedLocale in supportedLocales) {
                if (supportedLocale.languageCode ==
                        deviceLocale!.languageCode &&
                    supportedLocale.countryCode == deviceLocale.countryCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
          );
        },
      );
}
