import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.limeAccent,
  scaffoldBackgroundColor: const Color(0xFF121212),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 16, color: Colors.white),
    titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.limeAccent),
);
