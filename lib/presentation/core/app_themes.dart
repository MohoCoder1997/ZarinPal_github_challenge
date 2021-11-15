import 'package:flutter/material.dart';

final appThemeData = {
  AppTheme.Light: ThemeData(),
  AppTheme.Dark: ThemeData(
    scaffoldBackgroundColor: Colors.black,
  )
};

enum AppTheme {
  Light,
  Dark,
}