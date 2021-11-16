import 'package:flutter/material.dart';

final appThemeData = {
  AppTheme.Light: ThemeData(
    scaffoldBackgroundColor: Color(0xffFFF9C4),
    primaryColor: Color(0xffFFEB3B),
    primaryColorLight: Color(0xffFFF9C4),
    primaryColorDark: Color(0xffFBC02D),
    accentColor: Color(0xff03A9F4),
    iconTheme: IconThemeData(
      color: Color(0xff212121),
    ),
    dividerColor: Color(0xffBDBDBD),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 24
      ),
        headline2: TextStyle(
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        fontSize: 22
      ),
      subtitle1: TextStyle(
        color: Color(0xff212121),
        fontWeight: FontWeight.w600,
        fontSize: 20
      ),
      subtitle2: TextStyle(
        color: Color(0xff757575),
        fontWeight: FontWeight.w400,
        fontSize: 18
      ),
    ),
  ),
  AppTheme.Dark: ThemeData(
    scaffoldBackgroundColor: Colors.black,
  )
};

enum AppTheme {
  Light,
  Dark,
}
