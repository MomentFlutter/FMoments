import "package:flutter/material.dart";

import "../theme/app_theme.dart";

class ChangeThemeButtonWidget extends StatelessWidget {
  final VoidCallback toggleTheme;

  ChangeThemeButtonWidget(this.toggleTheme);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: toggleTheme,
      icon: AppTheme.currentTheme == ThemeMode.light
          ? Icon(Icons.light_mode_outlined)
          : Icon(Icons.dark_mode_outlined),
    );
  }
}
