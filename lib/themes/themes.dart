import 'package:flutter/material.dart';

part 'color_schemes.g.dart';

ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: _lightColorScheme.primaryContainer,
    ),
    colorScheme: _lightColorScheme,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF00914B),
        foregroundColor: _lightColorScheme.background,
        extendedTextStyle: TextStyle(fontSize: 25)));

ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    colorScheme: _darkColorScheme,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      backgroundColor: _darkColorScheme.primaryContainer,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Color.fromARGB(255, 0, 93, 48),
        extendedTextStyle: TextStyle(fontSize: 25)));
