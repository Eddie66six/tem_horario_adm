import 'package:flutter/material.dart';

class AppThemeData{
  AppThemeData._();
  static AppThemeData _instance;
  static AppThemeData get to => _instance ?? AppThemeData._();
  _AppThemeDataColors get colors => _AppThemeDataColors.to;
  _AppThemeDataFontSize get fontSize => _AppThemeDataFontSize.to;

  double get defaultRadius => 5.0;
  double get defaultHorizontalMargin => 10.0;
}


//insert color here
class _AppThemeDataColors {
  _AppThemeDataColors._();
  static _AppThemeDataColors _instance;
  static _AppThemeDataColors get to => _instance ?? _AppThemeDataColors._();

  //color
  Color get primary => Color.fromARGB(255, 112, 201, 203);
  Color get secondary => Color.fromARGB(255, 85, 183, 105);
  Color get negative => Color.fromARGB(255, 255, 0, 0);

}

//insert font size here
class _AppThemeDataFontSize {
  _AppThemeDataFontSize._();
  static _AppThemeDataFontSize _instance;
  static _AppThemeDataFontSize get to => _instance ?? _AppThemeDataFontSize._();

  //size
  double get small => 12.0;
  double get normal => 16.0;
  double get large => 21.0;
}