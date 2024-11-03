import 'package:ecza_nobet/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData get lightTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.lightBackgroundColor,
        primaryColor: AppColors.primaryLightColor,
        appBarTheme: _appBarTheme(),
        fontFamily: 'Quicksand',
        textTheme: _textTheme(),
        iconTheme: IconThemeData(color: AppColors.primaryLightColor),
        inputDecorationTheme: _inpuDecorationTheme(),
      );

  static TextTheme _textTheme() {
    return TextTheme(
      titleLarge: TextStyle(
        color: AppColors.primaryLightColor,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: TextStyle(
        color: AppColors.primaryDarkColor,
      ),
      bodyLarge: TextStyle(
        color: AppColors.primaryLightColor,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: AppColors.primaryLightColor,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      labelLarge: TextStyle(
        color: AppColors.primaryDarkColor,
        fontWeight: FontWeight.w700,
      ),
      displayMedium: const TextStyle(
        color: Colors.white,
        fontSize: 36,
        fontWeight: FontWeight.w800,
      ),
      headlineMedium: TextStyle(
        color: AppColors.primaryDarkColor,
        fontSize: 18,
        fontWeight: FontWeight.w800,
      ),
      labelSmall: TextStyle(
        color: AppColors.primaryDarkColor,
        fontSize: 12,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  static InputDecorationTheme _inpuDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      prefixIconColor: AppColors.primaryLightColor,
      hintStyle: TextStyle(
        color: AppColors.primaryLightColor,
        fontWeight: FontWeight.w800,
      ),
      enabledBorder: _outlineInputBorder(),
      focusedBorder: _outlineInputBorder(),
    );
  }

  static AppBarTheme _appBarTheme() {
    return const AppBarTheme(
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
    );
  }

  static OutlineInputBorder _outlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(
        color: Colors.transparent,
      ),
    );
  }
}
