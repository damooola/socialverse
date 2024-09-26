import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade50,
      primary: Colors.grey.shade400,
      secondary: Colors.grey.shade300,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade800,
    ),
    textTheme: ThemeData.light()
        .textTheme
        .apply(bodyColor: Colors.grey.shade800, displayColor: Colors.black));
