import 'package:flutter/material.dart';

extension ContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
}

extension MediaQueryExtension on BuildContext {
  double get height => mediaQuery.size.height;
  double get width => mediaQuery.size.width;

  double get lowValue => height * 0.01;
  double get normalValue => height * 0.02;
  double get mediumValue => height * 0.04;
  double get highValue => height * 0.1;
}

extension PaddingExtensionAll on BuildContext {
  EdgeInsets get paddingLow => EdgeInsets.all(lowValue);
  EdgeInsets get paddingNormal => EdgeInsets.all(normalValue);
  EdgeInsets get paddingMedium => EdgeInsets.all(mediumValue);
  EdgeInsets get paddingHigh => EdgeInsets.all(highValue);
}

extension PaddingExtensionSymetric on BuildContext {
  // Vertical Padding
  EdgeInsets get paddingLowVertical => EdgeInsets.symmetric(vertical: lowValue);
  EdgeInsets get paddingNormalVertical =>
      EdgeInsets.symmetric(vertical: normalValue);
  EdgeInsets get paddingMediumVertical =>
      EdgeInsets.symmetric(vertical: mediumValue);
  EdgeInsets get paddingHighVertical =>
      EdgeInsets.symmetric(vertical: highValue);

  // Horizontal Padding
  EdgeInsets get paddingLowHorizontal =>
      EdgeInsets.symmetric(horizontal: lowValue);
  EdgeInsets get paddingNormalHorizontal =>
      EdgeInsets.symmetric(horizontal: normalValue);
  EdgeInsets get paddingMediumHorizontal =>
      EdgeInsets.symmetric(horizontal: mediumValue);
  EdgeInsets get paddingHighHorizontal =>
      EdgeInsets.symmetric(horizontal: highValue);
}

extension ColorExtension on BuildContext {
  // ColorScheme Colors
  Color get colorSchemePrimary => colorScheme.primary;
  Color get colorSchemePrimaryVariant => colorScheme.primaryVariant;
  Color get colorSchemeSecondary => colorScheme.secondary;
  Color get colorSchemeSecondaryVariant => colorScheme.secondaryVariant;
  Color get colorSchemeSurface => colorScheme.surface;
  Color get colorSchemeBackground => colorScheme.background;
  Color get colorSchemeError => colorScheme.error;
  Color get colorSchemeOnPrimary => colorScheme.onPrimary;
  Color get colorSchemeOnSecondary => colorScheme.onSecondary;
  Color get colorSchemeOnSurface => colorScheme.onSurface;
  Color get colorSchemeOnBackground => colorScheme.onBackground;
  Color get colorSchemeOnError => colorScheme.onError;

  // Colors
  Color get scaffoldBackgroundColor => theme.scaffoldBackgroundColor;
  Color get backGroundColor => theme.backgroundColor;
  Color get primaryColor => theme.primaryColor;
  Color get accentColor => theme.accentColor;
  Color get errorColor => theme.errorColor;
  Color get hintColor => theme.hintColor;
  Color get hoverColor => theme.hoverColor;
  Color get indicatorColor => theme.indicatorColor;
  Color get shadowColor => theme.shadowColor;
}

extension TextExtension on BuildContext {
  TextStyle? get bodyText1 => textTheme.bodyText1;
  TextStyle? get bodyText2 => textTheme.bodyText2;
  TextStyle? get buttonText => textTheme.button;
  TextStyle? get captionText => textTheme.caption;
  TextStyle? get headline1 => textTheme.headline1;
  TextStyle? get headline2 => textTheme.headline2;
  TextStyle? get headline3 => textTheme.headline3;
  TextStyle? get headline4 => textTheme.headline4;
  TextStyle? get headline5 => textTheme.headline5;
  TextStyle? get headline6 => textTheme.headline6;
  TextStyle? get overlineText => textTheme.overline;
  TextStyle? get subtitle1 => textTheme.subtitle1;
  TextStyle? get subtitle2 => textTheme.subtitle2;
}
