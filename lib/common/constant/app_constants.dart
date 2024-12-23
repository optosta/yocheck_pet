
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static double elevation = 2.0;
  static double textFieldWidth = 272;
  static double textFieldHeight = 40;

  static const double boxItemHeight60 = 60;
  static const double signupTextFieldHeight = 50;
  static const double buttonHeight = 40;
  static const double buttonHeight50 = 50;
  static const double dropButtonHeight = 45;

  static double borderLightWidth = 1.5;
  static double borderMediumWidth = 2;
  static double borderBordWidth = 3;

  static BorderRadiusGeometry borderRadius = BorderRadius.circular(30);
  static BorderRadiusGeometry borderMediumRadius = BorderRadius.circular(20);
  static BorderRadiusGeometry borderLightRadius = BorderRadius.circular(12);

  static Radius radius = const Radius.circular(30);
  static Radius mediumRadius = const Radius.circular(20);
  static Radius lightRadius = const Radius.circular(8);

  static const double radiusValue30 = 30;
  static const double radiusValue20 = 20;
  static const double radiusValue10 = 10;

  static EdgeInsets viewPadding = const EdgeInsets.all(5.0);

  static List<String> get urineLabelList => [
    'blood'.tr(),
    'bilirubin'.tr(),
    'urobilnogen'.tr(),
    'ketones'.tr(),
    'protein'.tr(),
    'nitrate'.tr(),
    'glucosuria'.tr(),
    'ph'.tr(),
    'gravity'.tr(),
    'leukocytes'.tr(),
    'vitamins'.tr(),
  ];

  static LinearGradient gradient = const LinearGradient(
    begin: FractionalOffset.topCenter,
    end: FractionalOffset.bottomCenter,
    colors: [
      Color(0xfff7fbf7),
      Color(0xffa9dcab),
      Color(0xff94d895),
    ],
    stops: [0.01,2.0, 2.0],
  );
}