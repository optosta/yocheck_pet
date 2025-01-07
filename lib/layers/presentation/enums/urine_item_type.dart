import 'package:easy_localization/easy_localization.dart';

enum UrineItemType {
  blood,
  bilirubin,
  urobilnogen,
  ketones,
  protein,
  nitrate,
  glucosuria,
  ph,
  gravity,
  leukocytes,
  vitamins,
}

extension UrineItemTypeEx on UrineItemType {
  String get name =>
      switch(this){
        UrineItemType.blood => 'blood'.tr(),
        UrineItemType.bilirubin => 'bilirubin'.tr(),
        UrineItemType.urobilnogen => 'urobilnogen'.tr(),
        UrineItemType.ketones => 'ketones'.tr(),
        UrineItemType.protein => 'protein'.tr(),
        UrineItemType.nitrate => 'nitrate'.tr(),
        UrineItemType.glucosuria => 'glucosuria'.tr(),
        UrineItemType.ph => 'ph'.tr(),
        UrineItemType.gravity => 'gravity'.tr(),
        UrineItemType.leukocytes => 'leukocytes'.tr(),
        UrineItemType.vitamins => 'vitamins'.tr(),
      };

  // int get levelCount =>
  //     switch(this){
  //       UrineItemType.blood => 4,
  //       UrineItemType.bilirubin => 4,
  //       UrineItemType.urobilnogen => 5,
  //       UrineItemType.ketones => 4,
  //       UrineItemType.protein => 5,
  //       UrineItemType.nitrate => 2,
  //       UrineItemType.glucosuria => 4,
  //       UrineItemType.ph => 5,
  //       UrineItemType.gravity => 4,
  //       UrineItemType.leukocytes => 4,
  //       UrineItemType.vitamins => 4,
  //     };
}

