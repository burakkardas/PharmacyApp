import 'package:ecza_nobet/core/theme/app_colors.dart';
import 'package:ecza_nobet/providers/theme_providers.dart';
import 'package:ecza_nobet/utility/enums/theme_enum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormatName extends StatelessWidget {
  const FormatName({super.key, required this.name});

  final String name;
  @override
  Widget build(BuildContext context) {
    List<String> parts = name.split(' ');
    String firstLine = parts.sublist(0, parts.length - 1).join(' ');
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$firstLine\n',
            style: TextStyle(
              fontSize: firstLine.length > 10 ? 20 : 32,
              color: Provider.of<ThemeProvider>(context, listen: false)
                          .currentTheme ==
                      ThemeType.light
                  ? AppColors.primaryLightColor
                  : Colors.white,
              fontWeight: FontWeight.w900,
            ),
          ),
          TextSpan(
            text: parts.last,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primaryDarkColor,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
      textAlign: TextAlign.left,
    );
  }
}
