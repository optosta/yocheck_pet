import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';

import '../widget/style_text.dart';



class UrineHomeLower extends StatelessWidget {
  const UrineHomeLower({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        SizedBox(
          height: 130,
          width: double.infinity,
          child: Image.asset('${Texts.imagePath}/urine/home/home_bottom.png', fit: BoxFit.fitWidth,),
        ),
         Positioned(
          bottom: 40,
          left: 40,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StyleText(
                text:'home_bottom'.tr(),
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              const Row(
                children: [
                  StyleText(
                      text:'YO',
                      color: Colors.redAccent,
                      size: AppDim.fontSizeXxLarge,
                      fontWeight:  AppDim.weightBold,
                  ),
                  StyleText(
                      text:'CHECK ',
                      color: Colors.white,
                      size: AppDim.fontSizeXxLarge,
                      fontWeight: AppDim.weightBold,
                  ),
                  StyleText(
                    text:'P',
                    color: Colors.redAccent,
                    size: AppDim.fontSizeXxLarge,
                    fontWeight: AppDim.weightBold,
                  ),
                  StyleText(
                    text:'ET',
                    color: Colors.white,
                    size: AppDim.fontSizeXxLarge,
                    fontWeight: AppDim.weightBold,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }


}
