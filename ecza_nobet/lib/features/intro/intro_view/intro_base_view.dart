import 'package:ecza_nobet/core/theme/app_colors.dart';
import 'package:ecza_nobet/features/intro/intro_view/intro_view.dart';
import 'package:ecza_nobet/features/intro/model/intro_model.dart';
import 'package:ecza_nobet/features/intro/widgets/page_indicator.dart';
import 'package:flutter/material.dart';

class IntroBaseView extends StatelessWidget {
  const IntroBaseView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PageController controller = PageController();
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: _introBackgroundDecoration(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                PageView(
                  controller: controller,
                  children: [
                    for (var i = 0; i < IntroModel.introList.length; i++)
                      IntroView(intro: IntroModel.introList[i]),
                  ],
                ),
                PageIndicator(controller: controller),
              ],
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration _introBackgroundDecoration() {
    return BoxDecoration(
      color: AppColors.primaryLightColor,
    );
  }
}
