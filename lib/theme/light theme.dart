import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF6C4AB6),
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor: const Color(0xFFF9F7FC),

    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF6C4AB6),
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF6C4AB6),
      foregroundColor: Colors.white,
    ),
  );
}