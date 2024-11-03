import 'package:ecza_nobet/utility/enums/app_image_enum.dart';
import 'package:ecza_nobet/utility/extensions/app_image_extension.dart';

class IntroModel {
  static List<Intro> introList = [
    Intro(
        title: 'Nöbetçi Eczaneler Listesi',
        description:
            'Seçtiğiniz il veya ilçedeki tüm nöbetçi eczaneleri görüntüleyin ve ihtiyaç duyduğunuz eczaneye kolayca ulaşın.',
        imagePath: AppImageEnum.intro_01.getImagePath(isIntro: true)),
    Intro(
        title: 'Yol Tarifi',
        description:
            'Harita üzerinden en yakın nöbetçi eczaneye hızlı ve kolay yol tarifi alın.',
        imagePath: AppImageEnum.intro_02.getImagePath(isIntro: true)),
    Intro(
        title: 'Eczane İletişim Bilgileri',
        description:
            'Nöbetçi eczanelerin telefon numarası ve adres bilgilerine hızlıca ulaşın.',
        imagePath: AppImageEnum.intro_03.getImagePath(isIntro: true)),
  ];
}

class Intro {
  final String title;
  final String description;
  final String imagePath;

  Intro(
      {required this.title,
      required this.description,
      required this.imagePath});
}
