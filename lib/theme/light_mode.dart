import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
      surface: Colors.grey.shade100,
      primary: Colors.grey.shade300,
      secondary: Colors.grey.shade500,
      tertiary: Colors.white,
      inversePrimary: Colors.grey.shade800,
    ),
    textTheme: ThemeData.light()
        .textTheme
        .apply(bodyColor: Colors.grey.shade800, displayColor: Colors.black));
