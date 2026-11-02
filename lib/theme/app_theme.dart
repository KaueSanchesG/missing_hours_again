import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData capybara = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7A5C43),
      primary: Color(0xFF7A5C43),
      secondary: Color(0xFF81B29A),
      surface: Color(0xFFFAEDCD),
      tertiary: Color(0xFFD4A373),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF83C5BE),
        foregroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );
}
