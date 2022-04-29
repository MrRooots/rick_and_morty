import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Class that contains the main theme of the application
/// and all custom colors that are used inside
class Palette {
  // Colors
  static const Color black = Color(0xff2d2d2d);
  static const Color grey = Color(0xFF757575);

  static const Color orange = Color(0xfff65b4e);

  static const Color green = Color(0xff5ABB56);
  static const Color red = Color(0xffF96060);
  static const Color yellow = Color(0xffF4CA8F);

  static const Color twilight = Color(0xff29319f);
  static const Color fog = Color(0xffffdeef);
  static const Color eclipse = Color(0xff573353);

  // Theme
  static final ThemeData theme = ThemeData(
    appBarTheme: const AppBarTheme(
      titleTextStyle: TextStyle(fontSize: 18.0, color: Palette.black),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: Colors.white,
      iconTheme: IconThemeData(color: Palette.black, size: 18.0),
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 18.0,
        color: black,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle1: TextStyle(fontSize: 14.0, color: grey),
      headline6: TextStyle(fontSize: 16.0, color: black),
    ),
    fontFamily: 'Muli',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: const InputDecorationTheme(
      suffixIconColor: Palette.black,
      floatingLabelStyle: TextStyle(color: Palette.orange),
      border: InputBorder.none,
      errorStyle: TextStyle(fontSize: 14.0),
      focusColor: Palette.black,
      hintStyle: TextStyle(fontSize: 16.0),
    ),
    iconTheme: const IconThemeData(color: Palette.orange, size: 28.0),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Palette.orange,
    ),
    textSelectionTheme: const TextSelectionThemeData(cursorColor: black),
  );
}
