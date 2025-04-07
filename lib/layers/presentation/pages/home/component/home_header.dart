import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/layers/presentation/pages/home/home_viewmodel.dart';

import '../../../../../common/common.dart';
import '../../../widgets/style_text.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.13,
      margin: const EdgeInsets.symmetric(horizontal: AppDim.large),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// 헤더 텍스트문
          Flexible(
            flex: 7,
            child: Column(
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
                            StyleText(
                              text: 'home_subtitle'.tr(),
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
                    StyleText(
                      text: 'home_subtitle2'.tr(),
                      softWrap: true,
                      maxLinesCount: 2,
                      overflow: TextOverflow.ellipsis,
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
          ),

          /// 헤더 좌측 이미지
          Flexible(
            flex: 2,
            child: Image.asset(
              'assets/images/urine/home/header_icon.png',
              height: 60,
            ),
          ),
          AppDim.widthSmall,
        ],
      ),
    );
  }
}
