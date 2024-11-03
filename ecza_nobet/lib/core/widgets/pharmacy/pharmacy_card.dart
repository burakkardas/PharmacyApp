import 'package:ecza_nobet/core/widgets/app_button.dart';
import 'package:ecza_nobet/core/widgets/format_name.dart';
import 'package:ecza_nobet/models/pharmacy_model/pharmacy_model.dart';
import 'package:ecza_nobet/providers/theme_providers.dart';
import 'package:ecza_nobet/utility/enums/app_image_enum.dart';
import 'package:ecza_nobet/utility/enums/theme_enum.dart';
import 'package:ecza_nobet/utility/extensions/app_image_extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PharmacyCard extends StatelessWidget {
  const PharmacyCard({super.key, required this.pharmacyResult});

  final Result pharmacyResult;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: _cardDecoration(context, size),
    );
  }

  Container _cardDecoration(BuildContext context, Size size) {
    return Container(
      width: size.width,
      height: size.height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Provider.of<ThemeProvider>(context, listen: false)
                        .currentTheme ==
                    ThemeType.light
                ? AppImageEnum.card_bg.getImagePath(isIntro: false)
                : AppImageEnum.card_bg_dark.getImagePath(isIntro: false)),
            fit: BoxFit.fill),
      ),
      child: _cardContent(context),
    );
  }

  Padding _cardContent(BuildContext context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _cardTopContent(context),
            _cardBottomContent(context),
          ],
        ),
      );

  Column _cardBottomContent(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pharmacyResult.address!,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                formatPhoneNumber(pharmacyResult.phone!),
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const AppButton(),
            ],
          ),
        ],
      );

  Row _cardTopContent(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FormatName(name: pharmacyResult.name!),
          Text(
            pharmacyResult.dist!,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ],
      );

  void onPressed() {}

  String formatPhoneNumber(String phoneNumber) {
    return '(${phoneNumber.substring(0, 4)}) ${phoneNumber.substring(3, 6)} ${phoneNumber.substring(6, 8)} ${phoneNumber.substring(8, 10)}';
  }
}
