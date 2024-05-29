import 'package:flutter/material.dart';

const fontFamily = 'Poppins';

final themeLight = ThemeData(
  primaryColorLight: const Color(0xff00a8f4),
  brightness: Brightness.light,
  primaryColor: const Color(0xff00a8f4),
  highlightColor: Colors.black,
  canvasColor: Colors.white,
  fontFamily: fontFamily,
  backgroundColor: Colors.white,
  splashColor: Colors.transparent,
  scaffoldBackgroundColor: Colors.white,
  colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(
    secondary: Colors.black,
    brightness: Brightness.light,
  ),
);

final themeDark = ThemeData(
  brightness: Brightness.dark,
  primaryColorDark: const Color(0xff00a8f4),
  primaryColor: const Color(0xff00a8f4),
  highlightColor: const Color(0xff00a8f4),
  canvasColor: Colors.white,
  fontFamily: fontFamily,
  splashColor: Colors.transparent,
  backgroundColor: Colors.grey[800],
  scaffoldBackgroundColor: Colors.black,
  // colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
  //   secondary: Colors.green.shade600,
  //   brightness: Brightness.dark,
  // ),
);
