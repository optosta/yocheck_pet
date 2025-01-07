import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../common/constant/texts.dart';

enum BluetoothStatus {
  scan,
  connect,
  inspection,
  scanError,
  connectError,
  inspectionError,
  unableError,
  stripError,
  cutoff;
}


///TODO: 영문으로 변경해야됨
extension BluetoothStatusX on BluetoothStatus {
  String get title =>
      switch(this){
        BluetoothStatus.scan => 'title_scan'.tr(),
        BluetoothStatus.connect => 'title_connect'.tr(),
        BluetoothStatus.inspection => 'title_inspection'.tr(),
        BluetoothStatus.scanError => 'title_scan_error'.tr(),
        BluetoothStatus.connectError => 'title_connect_error'.tr(),
        BluetoothStatus.unableError => 'title_unable_error'.tr(),
        BluetoothStatus.inspectionError => 'title_inspection_error'.tr(),
        BluetoothStatus.stripError => 'title_strip_error'.tr(),
        BluetoothStatus.cutoff => 'title_cutoff'.tr(),
      };

  String get subTitle =>
      switch(this){
        BluetoothStatus.scan => 'subtitle_scan'.tr(),
        BluetoothStatus.connect => 'subtitle_connect'.tr(),
        BluetoothStatus.inspection => 'subtitle_inspection'.tr(),
        BluetoothStatus.scanError => 'subtitle_scan_error'.tr(),
        BluetoothStatus.connectError => 'subtitle_connect_error'.tr(),
        BluetoothStatus.unableError => 'subtitle_unable_error'.tr(),
        BluetoothStatus.inspectionError => 'subtitle_inspection_error'.tr(),
        BluetoothStatus.stripError => 'subtitle_strip_error'.tr(),
        BluetoothStatus.cutoff => 'subtitle_cutoff'.tr(),
      };

  Color? get waveColor =>
      switch(this){
        BluetoothStatus.scan => Colors.blue.shade100,
        BluetoothStatus.connect => Colors.orange.shade100,
        BluetoothStatus.inspection => const Color(0xffffd0cc),
        BluetoothStatus.scanError => null,
        BluetoothStatus.connectError => null,
        BluetoothStatus.unableError => null,
        BluetoothStatus.inspectionError => null,
        BluetoothStatus.stripError => null,
        BluetoothStatus.cutoff => null,
      };

  String? get retryBtnLabel =>
      switch(this){
        BluetoothStatus.scan => null,
        BluetoothStatus.connect => null,
        BluetoothStatus.inspection => null,
        BluetoothStatus.scanError => 're-search'.tr(),
        BluetoothStatus.connectError => 'reconnect'.tr(),
        BluetoothStatus.unableError => 're-examination'.tr(),
        BluetoothStatus.inspectionError => 're-examination'.tr(),
        BluetoothStatus.stripError => 're-examination'.tr(),
        BluetoothStatus.cutoff => 're-search'.tr(),
      };

  String? get errorImage =>
      switch(this){
        BluetoothStatus.scan => null,
        BluetoothStatus.connect => null,
        BluetoothStatus.inspection => null,
        BluetoothStatus.scanError => '${Texts.imagePath}/urine/bluetooth/device_error.png',
        BluetoothStatus.connectError => '${Texts.imagePath}/urine/bluetooth/device_error.png',
        BluetoothStatus.unableError => '${Texts.imagePath}/urine/bluetooth/device_error.png',
        BluetoothStatus.inspectionError => '${Texts.imagePath}/urine/bluetooth/device_error.png',
        BluetoothStatus.stripError => '${Texts.imagePath}/urine/bluetooth/strip_error.png',
        BluetoothStatus.cutoff => '${Texts.imagePath}/urine/bluetooth/device_error.png',
      };
}


//
// enum BluetoothStatus {
//   scan('blue_state_scan'),
//   connect('blue_state_connect'),
//   inspection('blue_state_inspection'),
//   scanError('blue_state_scanError'),
//   connectError('blue_state_connectError'),
//   unableError('blue_state_unableError'),
//   inspectionError('blue_state_inspectionError'),
//   stripError('blue_state_stripError'),
//   cutoff('blue_state_cutoff');
//
//   const BluetoothStatus(this.message);
//
//   final String message;
// }
