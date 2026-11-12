import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(
      seedColor:  Color(0xFF6C4AB6),
      brightness: Brightness.light,
    ),

    scaffoldBackgroundColor:  Color(0xFFF9F7FC),

    appBarTheme: AppBarTheme(
      backgroundColor: Color(0xFF6C4AB6),
      foregroundColor: Colors.white,
      elevation: 0,
    ),

    floatingActionButtonTheme:  FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF6C4AB6),
      foregroundColor: Colors.white,
    ),
  );
}