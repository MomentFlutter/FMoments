import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter/services.dart";

class AppLocalization {
  late final Locale locale;

  AppLocalization(this.locale);

  static AppLocalization of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization)!;
  }

  late Map<String, String> _localizedValues;

  Future load(String filepath) async {
    String jsonStringValues =
        await rootBundle.loadString("${filepath}/${locale.languageCode}.json");

    Map<String, dynamic> mappedJson = json.decode(jsonStringValues);

    _localizedValues = mappedJson.map((key, value) => MapEntry(key, value));
  }

  String? translate(String key) {
    return _localizedValues[key];
  }

  static LocalizationsDelegate<AppLocalization> delegate({
    filepath = "assets/lang",
  }) =>
      _AppLocalizationDelegate(filepath);
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  final String filePath;

  const _AppLocalizationDelegate(this.filePath);

  @override
  bool isSupported(Locale locale) {
    return ["en", "fr", "hi"].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = new AppLocalization(locale);
    await localization.load(filePath);
    return localization;
  }

  @override
  bool shouldReload(_AppLocalizationDelegate old) => false;
}
