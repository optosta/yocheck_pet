import 'package:easy_localization/easy_localization.dart';

enum HomeButtonType {
  inspection,
  history,
  ingredient,
  transition;
}

extension HomeButtonTypeX on HomeButtonType {
  String get name => switch(this) {
        HomeButtonType.inspection => 'home_inspection'.tr(),
        HomeButtonType.history => 'home_history'.tr(),
        HomeButtonType.ingredient => 'home_analysis'.tr(),
        HomeButtonType.transition => 'home_trends'.tr(),
      };

  String get imagePath => switch(this) {
    HomeButtonType.inspection => 'assets/images/urine/home/inspection_icon.png',
    HomeButtonType.history => 'assets/images/urine/home/history_icon.png',
    HomeButtonType.ingredient => 'assets/images/urine/home/ingredient_icon.png',
    HomeButtonType.transition => 'assets/images/urine/home/transition_icon.png',
  };
}
