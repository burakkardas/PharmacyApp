import 'package:ecza_nobet/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DarkTheme {
  static ThemeData get darkTheme => ThemeData(
        scaffoldBackgroundColor: AppColors.darkBackgroundColor,
        appBarTheme: _appBarTheme(),
        primaryColor: AppColors.primaryLightColor,
        fontFamily: 'Quicksand',
        iconTheme: IconThemeData(color: AppColors.primaryDarkColor),
        textTheme: _textTheme(),
        inputDecorationTheme: _inpuDecorationTheme(),
      );

  static TextTheme _textTheme() {
    return TextTheme(
      titleLarge: TextStyle(
        color: AppColors.primaryDarkColor,
        fontWeight: FontWeight.w600,
      ),
      titleMedium: const TextStyle(
        color: Colors.white,
      ),
      bodyLarge: TextStyle(
        color: AppColors.primaryDarkColor,
        fontWeight: FontWeight.w600,
      ),
      headlineSmall: TextStyle(
        color: AppColors.primaryDarkColor,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      labelLarge: const TextStyle(
        color: Colors.white60,
        fontWeight: FontWeight.w700,
      ),
      labelSmall: const TextStyle(
        color: Colors.white60,
        fontSize: 12,
        fontWeight: FontWeight.w800,
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
    );
  }

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: AppColors.primaryDarkColor);
  }

  static InputDecorationTheme _inpuDecorationTheme() {
    return InputDecorationTheme(
      filled: true,
      fillColor: AppColors.cardDarkBackgroundColor,
      prefixIconColor: AppColors.primaryDarkColor,
      hintStyle: TextStyle(
        color: AppColors.primaryDarkColor,
        fontWeight: FontWeight.w800,
      ),
      enabledBorder: _outlineInputBorder(),
      focusedBorder: _outlineInputBorder(),
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
