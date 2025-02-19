import 'package:flutter/material.dart';
import 'package:yocheck_pet/layers/presentation/widgets/style_text.dart';

import '../../../../../../common/common.dart';
import '../../../../../model/vo_package.dart';

class OpensourceItem extends StatelessWidget {
  final Package package;

  const OpensourceItem(this.package, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
        bottom: 30,
      ),
      color: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // package.name.text.size(20).bold.make().pOnly(left:20, bottom: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20, bottom: 8),
            child: StyleText(
              text: package.name,
              size: AppDim.fontSizeXxxLarge,
              fontWeight: AppDim.weightBold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 8),
            child: StyleText(
              text: package.description,
              size: AppDim.fontSizeXxLarge,
              fontWeight: AppDim.weight400,
              softWrap: true,
              maxLinesCount: 10,
            ),
          ),
          if (package.authors.isNotEmpty) //(package.authors.join(", "))
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 12),
              child: StyleText(
                text: package.authors.join(", "),
                size: AppDim.fontSizeXLarge,
                fontWeight: AppDim.weight400,
                softWrap: true,
                maxLinesCount: 10,
              ),
            ),

          if (isNotBlank(package.homepage))
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 15),
              child: StyleText(
                text: package.homepage ?? "",
                fontWeight: AppDim.weight400,
                softWrap: true,
                maxLinesCount: 10,
              ),
            ),
          Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                border: Border.all(color: AppColors.greyBoxBorder),
                borderRadius: BorderRadius.circular(4)),
            margin: const EdgeInsets.only(left: 20, top: 15, right: 20),
            height: 230,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppDim.small),
              child: Column(
                children: [
                  StyleText(
                    text: package.license ?? "",
                    softWrap: true,
                    maxLinesCount: 100,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
