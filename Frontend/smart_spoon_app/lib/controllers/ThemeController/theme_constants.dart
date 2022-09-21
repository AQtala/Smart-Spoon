import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const COLOR_PRIMARY = Color.fromARGB(255, 255, 220, 155);
// ignore: constant_identifier_names
const COLOR_PRIMARY_SHADOW = Color.fromARGB(255, 119, 86, 43);
// ignore: constant_identifier_names
const COLOR_PRIMARY_DARK = Color.fromARGB(255, 68, 44, 46);
// ignore: constant_identifier_names
const COLOR_ACCENT = Color.fromARGB(255, 155, 140, 41);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: COLOR_PRIMARY,
  secondaryHeaderColor: COLOR_ACCENT,
  canvasColor: const Color.fromRGBO(248, 251, 255, 1),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      backgroundColor: MaterialStateProperty.all<Color>(COLOR_ACCENT),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: COLOR_PRIMARY,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(0),
      primary: Colors.white,
      minimumSize: const Size(50, 50),
      maximumSize: const Size(50, 50),
    ),
  ),
);
