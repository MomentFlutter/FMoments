import "package:dls/language/language.dart";
import "package:dls/theme/app_theme.dart";
import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";

class SystemProvider extends ChangeNotifier {
  Locale locale = SchedulerBinding.instance.window.locale;
  ThemeMode themeMode = AppTheme.currentTheme;

  bool get isLightMode => themeMode == ThemeMode.light;
  void toggleTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    AppTheme.currentTheme = themeMode;
    notifyListeners();
  }

  void changeLanguage(Language language) {
    locale = Locale(language.languageCode, language.countryCode);
    notifyListeners();
  }
}
