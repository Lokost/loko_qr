import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData? get light 
    => ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(
        primary: Colors.purple,
        secondary: Colors.red,
        onSecondary: Colors.lightBlue,
      ),
    );

    static ThemeData? get dark
    => ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(
        primary: Colors.white,
        surface: Colors.red,
        secondary: Colors.purple,
        onSecondary: Color.fromARGB(255, 50, 50, 255)
      )
    );
}