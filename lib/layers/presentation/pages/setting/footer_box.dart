
import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import '../../widgets/style_text.dart';

class FooterBox extends StatelessWidget {
  const FooterBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.all(AppDim.medium),
      color: Colors.grey.shade200,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StyleText(
            text: '(주)청도제약',
            size: AppDim.fontSizeSmall,
            fontWeight: AppDim.weight600,
          ),
          StyleText(
            text: '주소 : 강원특별자치도 춘천시 소양강로 32, 하이테크벤처타운 202-2\nTel : 033-258-6114\n사업자 등록번호 안내 : 222-81-38081\nCopyright  2024 ㈜청도제약. All rights reserved.',
            softWrap: true,
            height: 2,
            size: AppDim.fontSizeXSmall,
            maxLinesCount: 10,
            fontWeight: AppDim.weight400,
          )
        ],
      ),
    );
  }
}
