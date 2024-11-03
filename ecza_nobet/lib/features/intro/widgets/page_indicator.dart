import 'package:ecza_nobet/core/theme/app_colors.dart';
import 'package:ecza_nobet/features/intro/model/intro_model.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndicator extends StatelessWidget {
  const PageIndicator({super.key, required this.controller});

  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: IntroModel.introList.length,
      effect: ExpandingDotsEffect(
        activeDotColor: Colors.white,
        dotColor: AppColors.primaryDarkColor,
        expansionFactor: 4,
        dotWidth: 12,
        dotHeight: 12,
      ),
    );
  }
}
