import 'package:ecza_nobet/core/theme/app_theme.dart';
import 'package:ecza_nobet/utility/enums/theme_enum.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  final String _themeKey = 'theme';
  ThemeType _currentThemeType = ThemeType.light;
  ThemeType get currentTheme => _currentThemeType;

  ThemeData get currentThemeType =>
      AppTheme().getCurrentTheme(targetTheme: _currentThemeType);

  void changeTheme() {
    _currentThemeType =
        _currentThemeType == ThemeType.light ? ThemeType.dark : ThemeType.light;
    _saveThemeToPrefs(_currentThemeType);
    notifyListeners();
  }

  void _saveThemeToPrefs(ThemeType theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        _themeKey, theme == ThemeType.light ? 'light' : 'dark');
  }

  Future<void> loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString(_themeKey);

    if (theme != null && theme == 'dark') {
      _currentThemeType = ThemeType.dark;
    } else {
      _currentThemeType = ThemeType.light;
    }
    notifyListeners();
  }
}
