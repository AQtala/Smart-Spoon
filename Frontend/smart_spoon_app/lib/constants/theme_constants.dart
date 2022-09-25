import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const COLOR_PRIMARY = Color.fromARGB(255, 78, 198, 214);
// ignore: constant_identifier_names
const COLOR_PRIMARY_SHADOW = Color.fromARGB(255, 0, 184, 184);
// ignore: constant_identifier_names
const COLOR_PRIMARY_DARK = Color.fromARGB(255, 44, 55, 68);
// ignore: constant_identifier_names
const COLOR_ACCENT = Color.fromARGB(255, 255, 255, 255);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: COLOR_PRIMARY,
  shadowColor: COLOR_PRIMARY_SHADOW,
  canvasColor: const Color.fromRGBO(248, 251, 255, 1),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      backgroundColor: MaterialStateProperty.all<Color>(COLOR_PRIMARY),
    ),
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: COLOR_PRIMARY,
  shadowColor: COLOR_PRIMARY_SHADOW,
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
      backgroundColor: MaterialStateProperty.all<Color>(COLOR_PRIMARY),
    ),
  ),
);
