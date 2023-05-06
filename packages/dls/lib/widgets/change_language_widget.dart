import "package:flutter/material.dart";

import "../language/language.dart";

class ChangeLanguageWidget extends StatelessWidget {
  final ValueChanged<Language> changeLanguage;

  ChangeLanguageWidget(this.changeLanguage);

  @override
  Widget build(BuildContext context) {
    AppBarTheme appBarTheme = Theme.of(context).appBarTheme;
    return DropdownButton<Language>(
      dropdownColor: appBarTheme.backgroundColor,
      underline: SizedBox(),
      icon: Icon(
        Icons.language,
        color: Colors.white,
      ),
      onChanged: (Language? language) {
        this.changeLanguage(language!);
      },
      items: Language.languageList()
          .map<DropdownMenuItem<Language>>(
            (e) => DropdownMenuItem<Language>(
              value: e,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    e.flag,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    e.name,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
