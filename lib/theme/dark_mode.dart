import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.grey.shade700,
      secondary: Colors.grey.shade200,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade300,
    ),
    textTheme: ThemeData.dark()
        .textTheme
        .apply(bodyColor: Colors.grey.shade300, displayColor: Colors.white));
