import 'package:flutter/material.dart';

import '../../../common/common.dart';

enum PosNegType {
  positive,
  negative,
}

extension PosNegTypeX on PosNegType {
  String get label => switch (this) {
        PosNegType.positive => 'positive'.tr(),
        PosNegType.negative => 'negative'.tr(),
      };

  Color get backgroundColor =>
      switch(this){
         PosNegType.positive => AppColors.posBgColor,
        PosNegType.negative => AppColors.negBgColor,
      };

  Color get textColor =>
      switch(this){
        PosNegType.positive => AppColors.posTextColor,
        PosNegType.negative => AppColors.negTextColor,
      };

}
