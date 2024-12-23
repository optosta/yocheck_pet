import 'package:easy_localization/easy_localization.dart';

import '../../../common/constant/constants.dart';

enum ArrangementType {
  bluetooth,
  device
}

extension ArrangementTypeX on ArrangementType {
  String get imagePath => switch (this) {
        ArrangementType.bluetooth =>
          '${Texts.imagePath}/urine/arrangement/bluetooth.png',
        ArrangementType.device =>
          '${Texts.imagePath}/urine/arrangement/power.png',
      };

  String get onActiveText => switch (this) {
        ArrangementType.bluetooth => 'bluetooth_on'.tr(),
        ArrangementType.device => 'device_on'.tr(),
      };

  String get offActiveText => switch (this) {
        ArrangementType.bluetooth => 'bluetooth_off'.tr(),
        ArrangementType.device => 'device_off'.tr(),
      };
  String get subTitle => switch (this) {
    ArrangementType.bluetooth => 'bluetooth_subtitle'.tr(),
    ArrangementType.device => 'device_subtitle'.tr(),
  };
}
