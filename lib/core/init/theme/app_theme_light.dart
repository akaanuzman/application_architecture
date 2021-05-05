import 'app_theme.dart';
import 'package:flutter/material.dart';

class AppThemeLight extends AppTheme{
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    if (_instance != null)
      return _instance!;
    else {
      _instance = AppThemeLight._init();
      return _instance!;
    }
  }

  AppThemeLight._init();

  ThemeData get theme => ThemeData.light();
}