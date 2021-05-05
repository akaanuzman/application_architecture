import 'package:flutter/material.dart';

import '../../constants/enum/app_theme_enum.dart';
import '../theme/app_theme_light.dart';

class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppThemeLight.instance.theme;
  ThemeData get currentTheme => _currentTheme;

  void changeValue(ApplicationThemeEnum themeEnum) {
    switch (themeEnum) {
      case ApplicationThemeEnum.LIGHT:
        _currentTheme = ThemeData.light();
        break;

      case ApplicationThemeEnum.DARK:
        _currentTheme = ThemeData.dark();
    }
  }
}
