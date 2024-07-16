import 'dart:ui';

import 'package:components/components.dart';
import 'package:components/src/theme/dimens.dart';
import 'package:flutter/material.dart';

const _dividerThemeData = DividerThemeData(space: 0);

abstract class NexusThemeData {
  ThemeData get materialThemeData;

  double screenMargin = Dimens.macro;

  double gridSpacing = Dimens.macro;

// TODO: add colors and other theme data
  Color get buttonBackgroundColor;

  Color get buttonTextColor;

  TextStyle? get buttonTextStyle => const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      );

  double get buttonWidth => 100;

  double get buttonHeight => 45;

  double get buttonElevation => 0;

  double get buttonBorderRadius => Dimens.nano;

  Color get buttonBorderColor;

  Color get containerBorderColor;

  Color get textFieldFillColor => Colors.grey.shade50;

  double get textFieldBorderRadius => Dimens.nano;

  Color get textFieldLabelColor => Colors.grey;

  Color get textFieldBorderColor => Colors.grey.shade300;

  double get textFieldElevation => 1;

  EdgeInsets get containerPadding;
}

class LightNexusThemeData extends NexusThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.black.toMaterialColor(),
        dividerTheme: _dividerThemeData,
        appBarTheme: const AppBarTheme(color: AppColors.appBarColor),
        scaffoldBackgroundColor: AppColors.backgroundColor,
        buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
      );

  @override
  Color get buttonBackgroundColor => Colors.white;

  @override
  Color get buttonTextColor => Colors.black;

  @override
  Color get containerBorderColor => Colors.grey;

  @override
  EdgeInsets get containerPadding => const EdgeInsets.all(Dimens.nano);

  @override
  Color get buttonBorderColor => Colors.transparent;
}

class DarkNexusThemeData extends NexusThemeData {
  @override
  ThemeData get materialThemeData => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.white.toMaterialColor(),
        dividerTheme: _dividerThemeData,
        buttonTheme: const ButtonThemeData(buttonColor: Colors.white),
      );

  @override
  Color get buttonBackgroundColor => Colors.white;

  @override
  Color get buttonTextColor => Colors.black;

  @override
  Color get containerBorderColor => Colors.grey;

  @override
  EdgeInsets get containerPadding => const EdgeInsets.all(Dimens.nano);

  @override
  Color get buttonBorderColor => Colors.white;
}

extension on Color {
  Map<int, Color> _toSwatch() => {
        50: withOpacity(0.1),
        100: withOpacity(0.2),
        200: withOpacity(0.3),
        300: withOpacity(0.4),
        400: withOpacity(0.5),
        500: withOpacity(0.6),
        600: withOpacity(0.7),
        700: withOpacity(0.8),
        800: withOpacity(0.9),
        900: this,
      };

  MaterialColor toMaterialColor() => MaterialColor(value, _toSwatch());
}
