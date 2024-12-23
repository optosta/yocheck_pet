import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../enums/home_button_type.dart';
import 'menu_button.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: AppDim.large),
      child: Column(
        children: List.generate(
          HomeButtonType.values.length,
          (index) => Padding(
            padding: const EdgeInsets.only(top: AppDim.small),
            child: MenuButton(
              type: HomeButtonType.values[index],
              label: HomeButtonType.values[index].name,
            ),
          ),
        ),
      ),
    );
  }
}
