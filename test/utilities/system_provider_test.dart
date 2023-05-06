import "package:flutter/material.dart";
import "package:flutter_starter/utilities/system_provider.dart";
import "package:dls/language/language.dart";
import "package:flutter_test/flutter_test.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  group(
    "Tests for System Provider",
    () {
      test("Test for toggle theme", () {
        SystemProvider systemProvider = new SystemProvider();
        var initialTheme = systemProvider.themeMode;

        systemProvider.toggleTheme();

        expect(systemProvider.themeMode, isNot(initialTheme));
        expect(systemProvider.themeMode, equals(ThemeMode.dark));
      });
      test("Test for change language", () {
        SystemProvider systemProvider = new SystemProvider();
        Language language = new Language("🇮🇳", "हिंदी", "hi", "IN");

        systemProvider.changeLanguage(language);

        expect(
          systemProvider.locale.countryCode,
          equals(language.countryCode),
        );
        expect(
          systemProvider.locale.languageCode,
          equals(language.languageCode),
        );
      });
    },
  );
}
