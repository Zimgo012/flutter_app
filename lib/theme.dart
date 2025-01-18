import 'package:flutter/material.dart';

class AppTheme {
  // Define a light color scheme
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF6200EA), // Purple
    onPrimary: Colors.white,
    secondary: Color(0xFF03DAC6), // Teal
    onSecondary: Colors.black,
    surface: Colors.white,
    onSurface: Colors.black,
    error: Color(0xFFB00020),
    onError: Colors.white,
  );

  // Define a dark color scheme
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFBB86FC), // Light Purple
    onPrimary: Colors.black,
    secondary: Color(0xFF03DAC6), // Teal
    onSecondary: Colors.black,
    surface: Color(0xFF1E1E1E),
    onSurface: Colors.white,
    error: Color(0xFFCF6679),
    onError: Colors.black,
  );

  // Create light theme using the light color scheme
  static final ThemeData lightTheme = ThemeData(
    colorScheme: lightColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.primary,
      foregroundColor: lightColorScheme.onPrimary,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: lightColorScheme.primary),
      bodyLarge: TextStyle(fontSize: 16.0, color: lightColorScheme.onSurface),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightColorScheme.primary,
        foregroundColor: lightColorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    ),
  );

  // Create dark theme using the dark color scheme
  static final ThemeData darkTheme = ThemeData(
    colorScheme: darkColorScheme,
    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.primary,
      foregroundColor: darkColorScheme.onPrimary,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: darkColorScheme.primary),
      bodyLarge: TextStyle(fontSize: 16.0, color: darkColorScheme.onSurface),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkColorScheme.primary,
        foregroundColor: darkColorScheme.onPrimary,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      ),
    ),
  );
}
