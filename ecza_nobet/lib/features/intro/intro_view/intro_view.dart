import 'package:ecza_nobet/core/widgets/app_image.dart';
import 'package:ecza_nobet/features/intro/model/intro_model.dart';
import 'package:ecza_nobet/features/intro/widgets/intro_text.dart';
import 'package:flutter/material.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key, required this.intro});

  final Intro intro;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            AppImage(imagePath: intro.imagePath, height: 0.35),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            IntroText(intro: intro),
          ],
        ),
      );
}
