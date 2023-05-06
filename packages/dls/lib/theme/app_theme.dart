import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";

class AppTheme {
  static ThemeMode currentTheme =
      SchedulerBinding.instance.window.platformBrightness == Brightness.dark
          ? ThemeMode.dark
          : ThemeMode.light;

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: Colors.indigo,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.indigo,
      onPrimary: Colors.white,
      secondary: Colors.red,
      onSecondary: Colors.amber,
    ),
    cardTheme: CardTheme(
      color: Colors.black45,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.black45,
      ),
      titleMedium: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      titleSmall: TextStyle(
        color: Colors.black,
        fontSize: 18.0,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white10,
    appBarTheme: AppBarTheme(
      color: Colors.black45,
      iconTheme: IconThemeData(
        color: Colors.pink,
      ),
    ),
    colorScheme: ColorScheme.light(
      primary: Colors.white30,
      onPrimary: Colors.white,
      secondary: Colors.red,
    ),
    cardTheme: CardTheme(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.green,
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        color: Colors.white70,
      ),
      titleMedium: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      ),
    ),
  );
}
