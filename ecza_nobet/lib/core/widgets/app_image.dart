import 'package:flutter/material.dart';

class AppImage extends StatelessWidget {
  const AppImage({super.key, required this.imagePath, required this.height});

  final String imagePath;
  final double height;
  @override
  Widget build(BuildContext context) => SizedBox(
        width: MediaQuery.of(context).size.height * height,
        height: MediaQuery.of(context).size.height * height,
        child: FittedBox(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
      );
}
