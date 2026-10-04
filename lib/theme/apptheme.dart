import 'package:flutter/material.dart';

import 'darktheme.dart';
import 'light theme.dart';


class AppTheme {
  static ThemeData get lightTheme => LightTheme.theme;

  static ThemeData get darkTheme => DarkTheme.theme;
}