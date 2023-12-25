import 'package:flutter/material.dart';

class AppTheme {
  static const _pColor = Color(0xFF8BC34A);
  static const _sCOlor = Color(0xFF732BA4);
  static ThemeData light = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(backgroundColor: _pColor),
      primaryColor: _pColor,
      fontFamily: 'Jost',
      colorScheme: ColorScheme.fromSeed(
          seedColor: _pColor,
          brightness: Brightness.light,
          primary: _pColor,
          secondary: _sCOlor));
  static ThemeData dark = ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: _pColor,
      appBarTheme: const AppBarTheme(backgroundColor: _pColor),
      fontFamily: 'Jost',
      colorScheme: const ColorScheme.dark(
          primary: _pColor, secondary: _sCOlor, brightness: Brightness.dark));
}
