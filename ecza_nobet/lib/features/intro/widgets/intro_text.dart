import 'package:ecza_nobet/features/intro/model/intro_model.dart';
import 'package:flutter/material.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key, required this.intro});

  final Intro intro;
  @override
  Widget build(BuildContext context) => Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              intro.title,
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            Text(
              intro.description,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
}
