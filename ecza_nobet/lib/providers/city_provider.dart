import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CityProvider with ChangeNotifier {
  String _city = 'İstanbul';

  String get city => _city;

  CityProvider() {
    _loadCityFromPrefs();
  }

  void setCity(String newCity) {
    _city = newCity;
    _saveCityToPrefs(newCity);
    notifyListeners();
  }

  void _saveCityToPrefs(String city) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('city', city);
  }

  void _loadCityFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    String? savedCity = prefs.getString('city');

    if (savedCity != null) {
      _city = savedCity;
    } else {
      _city = 'İstanbul';
    }
    notifyListeners();
  }
}
