import 'package:flutter/material.dart';
import 'package:jadwalnya/models/schedule.dart';

// Default values for everything will go here. Think of it as res/values.xml
var jDefaultPadding = 20.0;
// Themes and stuff
final lightTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.green,
  brightness: Brightness.light,
  accentColor: Colors.green,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);
final darkTheme = ThemeData(
  visualDensity: VisualDensity.adaptivePlatformDensity,
  primarySwatch: Colors.green,
  brightness: Brightness.dark,
  accentColor: Colors.green,
  accentIconTheme: IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

ThemeData get getLightTheme => lightTheme;

ThemeData get getDarkTheme => darkTheme;
ThemeData _themeData;

//SQL Constants
final String tbName = "SCHEDULE";
final String uid = "uidSched";
final String imageUri = "imageUri";
final String title = "title";
final String timeBegin = "timeBegin";
final String timeEnd = "timeEnd";
final String classRoom = "classRoom";
final String assignment = "assignment";
final String stringType = "TEXT";
final String intType = "INTEGER";
final String primaryKey = "PRIMARY KEY";
