import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    colorScheme: ColorScheme.fromSeed(
      seedColor:  Color(0xFF8B6CCF),
      brightness: Brightness.dark,
    ),

    appBarTheme:  AppBarTheme(
      backgroundColor: Color(0xFF3A2A5A),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    floatingActionButtonTheme:  FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF8B6CCF),
      foregroundColor: Colors.white,
    ),
  );
}