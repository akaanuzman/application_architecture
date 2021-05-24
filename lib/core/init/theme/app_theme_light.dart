import 'package:application_architecture/core/init/theme/light/light_theme_interface.dart';
import 'package:application_architecture/core/init/theme/light/text_theme_light.dart';
import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppThemeLight extends AppTheme with ILightTheme {
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

  ThemeData get theme => ThemeData.light()
      .copyWith(colorScheme: _colorScheme, textTheme: _textTheme);

  ColorScheme get _colorScheme => ColorScheme(
      primary: colorSchemeLight.black,
      primaryVariant: colorSchemeLight.azure,
      secondary: Colors.green,
      secondaryVariant: Colors.indigo,
      surface: Colors.blue, //xx
      background: Color(0xfff6f9fc), //xx
      error: Colors.red[900]!,
      onPrimary: Colors.greenAccent,
      onSecondary: Colors.black, //x
      onSurface: Colors.white30,
      onBackground: Colors.black12,
      onError: Color(0xFFF9B916), //xx
      brightness: Brightness.light);

  TextTheme get _textTheme => TextTheme(
        headline1: textThemeLight.headline1,
        headline2: textThemeLight.headline2,
        headline3: textThemeLight.headline3,
        headline4: textThemeLight.headline4,
        headline5: textThemeLight.headline5,
        headline6: textThemeLight.headline6,
      );
}
