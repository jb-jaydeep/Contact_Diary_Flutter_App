import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lighttheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      // primary: Colors.green,
      inversePrimary: Colors.blue,
      // primaryContainer: Colors.purple,
      errorContainer: Colors.red,
    ),
  );

  static ThemeData darktheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.dark,
    ),
  );
}
