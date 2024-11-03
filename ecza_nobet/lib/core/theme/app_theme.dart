import 'package:ecza_nobet/core/theme/dark_theme.dart';
import 'package:ecza_nobet/core/theme/light_theme.dart';
import 'package:ecza_nobet/utility/enums/theme_enum.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getCurrentTheme({required ThemeType targetTheme}) {
    return targetTheme == ThemeType.light
        ? LightTheme.lightTheme
        : DarkTheme.darkTheme;
  }
}
