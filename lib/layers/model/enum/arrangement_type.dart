import '../../../common/constant/constants.dart';

enum ArrangementType {
  bluetooth(
    'insp_bluetooth_on',
    'insp_bluetooth_off',
    '${Texts.imagePath}/urine/arrangement/bluetooth_icon.png',
    'insp_enable_bluetooth',
  ),
  device(
    'insp_device_on',
    'insp_device_off',
    '${Texts.imagePath}/urine/arrangement/power_icon.png',
    'insp_enable_device',
  );

  const ArrangementType(
      this.stateOn,
      this.stateOff,
      this.image,
      this.recommend,
      );

  final String stateOn;
  final String stateOff;
  final String image;
  final String recommend;
}