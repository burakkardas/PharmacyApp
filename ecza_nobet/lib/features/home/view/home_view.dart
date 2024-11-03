import 'package:ecza_nobet/core/theme/app_colors.dart';
import 'package:ecza_nobet/core/widgets/pharmacy/pharmacy_card.dart';
import 'package:ecza_nobet/core/widgets/search_field.dart';
import 'package:ecza_nobet/features/home/widgets/home_title.dart';
import 'package:ecza_nobet/models/pharmacy_model/pharmacy_model.dart';
import 'package:ecza_nobet/providers/city_provider.dart';
import 'package:ecza_nobet/providers/theme_providers.dart';
import 'package:ecza_nobet/services/pharmacy_service.dart';
import 'package:ecza_nobet/utility/enums/theme_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<Result>> pharmacyData;

  @override
  void initState() {
    super.initState();
    pharmacyData = getPharmacyData();
  }

  Future<List<Result>> getPharmacyData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String? lastFetchDate = prefs.getString('last_fetch_date');
    String currentDate = DateTime.now().toIso8601String().substring(0, 10);
    if (lastFetchDate == currentDate) {
      String? savedData = prefs.getString('pharmacy_data');
      if (savedData != null) {
        List<Result> pharmacyList = (json.decode(savedData) as List)
            .map((item) => Result.fromJson(item))
            .toList();
        return pharmacyList;
      }
    }

    var cityProvider = Provider.of<CityProvider>(context, listen: false);
    Pharmacy pharmacy = await fetchPharmacies(city: cityProvider.city);

    if (pharmacy.result != null) {
      await prefs.setString('pharmacy_data', json.encode(pharmacy.result));
      await prefs.setString('last_fetch_date', currentDate);

      return pharmacy.result!;
    } else {
      throw Exception('Veri bulunamadı');
    }
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: _appBar(context),
        body: FutureBuilder<List<Result>>(
          future: pharmacyData,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('Veri bulunamadı'));
            } else {
              final pharmacyList = snapshot.data!;
              return _content(context, pharmacyList);
            }
          },
        ),
      );

  Padding _content(BuildContext context, List<Result> pharmacyList) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchField(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            'Nöbetçi Eczaneler',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return PharmacyCard(
                  pharmacyResult: pharmacyList[index],
                );
              },
              itemCount: pharmacyList.length,
            ),
          )
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      centerTitle: false,
      title: const HomeTitle(),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Provider.of<ThemeProvider>(context).currentTheme ==
                        ThemeType.light
                    ? Colors.white
                    : AppColors.cardDarkBackgroundColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Provider.of<ThemeProvider>(context).currentTheme ==
                        ThemeType.light
                    ? Icons.nightlight_round
                    : Icons.wb_sunny_rounded,
                color: Provider.of<ThemeProvider>(context).currentTheme ==
                        ThemeType.light
                    ? AppColors.primaryLightColor
                    : AppColors.primaryDarkColor,
              ),
            ),
          ),
        )
      ],
    );
  }
}
