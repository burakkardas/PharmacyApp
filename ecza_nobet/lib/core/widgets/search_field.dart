import 'package:ecza_nobet/core/theme/app_colors.dart';
import 'package:ecza_nobet/providers/city_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return Consumer<CityProvider>(
      builder: (context, cityProvider, child) {
        return TextField(
          onEditingComplete: () {
            cityProvider.setCity(controller.text);
          },
          style: TextStyle(
            color: Theme.of(context).iconTheme.color,
            fontWeight: FontWeight.w800,
          ),
          controller: controller,
          cursorColor: AppColors.primaryLightColor,
          decoration: InputDecoration(
            hintText: 'Search City',
            prefixIcon: const Icon(Icons.search),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        );
      },
    );
  }
}
