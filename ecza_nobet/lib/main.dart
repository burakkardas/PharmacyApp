import 'package:ecza_nobet/features/home/view/home_view.dart';
import 'package:ecza_nobet/features/intro/intro_view/intro_base_view.dart';
import 'package:ecza_nobet/providers/city_provider.dart';
import 'package:ecza_nobet/providers/theme_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => CityProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> isFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = prefs.getBool('first_time') ?? true;
    if (isFirstTime) {
      prefs.setBool('first_time', false);
    }
    return isFirstTime;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.wait([
        Provider.of<ThemeProvider>(context, listen: false).loadThemeFromPrefs(),
        isFirstTime(),
      ]),
      builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          bool isFirstTime = snapshot.data![1] as bool;
          return MaterialApp(
            title: 'Ecza Nöbet',
            debugShowCheckedModeBanner: false,
            theme: Provider.of<ThemeProvider>(context).currentThemeType,
            home: isFirstTime ? const IntroBaseView() : const HomeView(),
          );
        }
      },
    );
  }
}
