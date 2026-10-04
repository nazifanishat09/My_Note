import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    scaffoldBackgroundColor: Colors.white,

    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.deepPurple,
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
    ),
  );
}