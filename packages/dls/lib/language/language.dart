class Language {
  final String flag;
  final String name;
  final String languageCode;
  final String countryCode;

  Language(this.flag, this.name, this.languageCode, this.countryCode);

  static List<Language> languageList() {
    return <Language>[
      Language("🇨🇵", "française", "fr", "FR"),
      Language("🇺🇸", "English", "en", "US"),
      Language("🇮🇳", "हिंदी", "hi", "IN"),
    ];
  }
}
