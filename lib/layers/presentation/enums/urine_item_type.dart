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

extension UrineItemTypeX on UrineItemType {
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
}
