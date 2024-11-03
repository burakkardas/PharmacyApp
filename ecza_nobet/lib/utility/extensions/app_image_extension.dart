import 'package:ecza_nobet/utility/enums/app_image_enum.dart';

extension AppImageExtension on AppImageEnum {
  static const String _basePath = 'assets/images/';

  String getImagePath({required bool isIntro}) =>
      '$_basePath${isIntro ? 'intro/$name' : name}.png';
}
