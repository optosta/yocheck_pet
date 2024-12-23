
import 'package:easy_localization/easy_localization.dart';

enum DateRangeType {
  direct,
  week,
  month,
  sixmonth,
}

extension DateRangeTypeX on DateRangeType {
  String get name =>
      switch(this){
        DateRangeType.direct => 'period_direct'.tr(),
        DateRangeType.week => 'period_week'.tr(),
        DateRangeType.month => 'period_month'.tr(),
        DateRangeType.sixmonth => 'period_six_month'.tr(),
      };
}


