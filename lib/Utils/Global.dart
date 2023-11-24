import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Global {
  static int currentIndexStep = 0;

  static ThemeData AppLightTheme = ThemeData(
    colorSchemeSeed: Colors.green.shade400,
    useMaterial3: true,
  );
  static ThemeData AppDarkTheme = ThemeData(
    colorSchemeSeed: Colors.white,
    brightness: Brightness.dark,
    useMaterial3: true,
  );

  static TextStyle Intro_title = const TextStyle(
    color: Colors.green,
    fontSize: 30,
    letterSpacing: -1,
    wordSpacing: -1,
    fontWeight: FontWeight.bold,
  );
  static TextStyle Intro_bodytitle = const TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
    wordSpacing: 2,
    letterSpacing: -1,
    color: Colors.grey,
  );

  static XFile? img;
  static String? name;
  static String? email;
  static String? l_name;
  static String? number;
}
