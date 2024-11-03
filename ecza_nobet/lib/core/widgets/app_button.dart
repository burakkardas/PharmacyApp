import 'package:ecza_nobet/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
        child: Container(
          width: 80,
          height: 30,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: AppColors.primaryLightColor,
          ),
          child: const Center(
            child: Text(
              'Yol Tarifi',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
            ),
          ),
        ),
      );
}
