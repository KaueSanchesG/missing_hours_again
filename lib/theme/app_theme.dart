import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData capybara = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,

    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF7A5C43),
      primary: Color(0xFF7A5C43), // Marrom escuro para alto contraste nas horas
      secondary: Color(0xFF81B29A), // Verde sálvia
      surface: Color(0xFFFAEDCD), // O seu bege atual
      tertiary: Color(
        0xFFD4A373,
      ), // O seu caramelo antigo, agora para detalhes menores
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
