import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/layers/presentation/pages/home/home_viewmodel.dart';

import '../../../../../common/common.dart';
import '../../../widgets/style_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(left: AppDim.large),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppDim.heightMedium,

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Consumer<HomeViewModel>(
                    builder: (context, provider, child) {
                      return Row(
                        children: [
                          StyleText(
                            text: provider.userName,
                            softWrap: true,
                            maxLinesCount: 2,
                            decorationColor: AppColors.lightGreen,
                            decorationThickness: 2,
                            decoration: TextDecoration.underline,
                            color: AppColors.blackTextColor,
                            size: AppDim.fontSizeXLarge,
                            fontWeight: AppDim.weight600,
                            align: TextAlign.start,
                          ),
                          const StyleText(
                            text: ' 소변검사로',
                            softWrap: true,
                            maxLinesCount: 2,
                            color: AppColors.blackTextColor,
                            size: AppDim.fontSizeXLarge,
                            fontWeight: AppDim.weight600,
                            align: TextAlign.start,
                          ),
                        ],
                      );
                    },
                  ),
                  AppDim.heightXSmall,

                  const StyleText(
                    text: '우리아이 건강을 지킬 수 있어요!',
                    softWrap: true,
                    maxLinesCount: 2,
                    color: AppColors.blackTextColor,
                    size: AppDim.fontSizeXLarge,
                    fontWeight: AppDim.weight600,
                    align: TextAlign.start,
                  ),
                ],
              ),
              AppDim.heightXSmall,

            ],
          ),
          Image.asset(
            'assets/images/urine/home/header_icon.png',
            height: 60,
          ),
          AppDim.widthSmall,
        ],
      ),
    );
  }
}
