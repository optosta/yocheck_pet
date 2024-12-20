
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/common/utils/snackbar_utils.dart';
import 'package:yocheck_pet/common/utils/text_format.dart';
import 'package:yocheck_pet/layers/presentation/pages/history/history_viewmodel.dart';

import '../../../../entity/history_dto.dart';
import '../../../widgets/style_text.dart';
import '../../result/result_view.dart';

class HistoryListItem extends StatelessWidget {

  final HistoryDataDTO history;

  const HistoryListItem({Key? key,
    required this.history,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HistoryViewModel>(context, listen: false);

    return InkWell(
      /// 아이템 클릭 시 이벤트 처리
      onTap: () => viewModel.getUrineResultDio(history.datetime)
          .then((urineStatus)=>{
            if(urineStatus.isNotEmpty && urineStatus.length == 11){
              Nav.doPush(context, UrineResultView(urineList: urineStatus, testDate: history.datetime)),
            } else {
              SnackBarUtils.showPrimarySnackBar(context, '데이터 손상이 있습니다. 다시 시도해주세요.')
            }
          }),
      child: SizedBox(
          height: 85,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    StyleText(
                        text: TextFormat.convertTimestamp(history.datetime),
                        color: AppColors.blackTextColor,
                        size: AppDim.fontSizeSmall,
                        fontWeight: AppDim.weight500,
                        maxLinesCount: 1,
                    ),
                    const Gap(AppDim.small),

                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: AppDim.xSmall, horizontal: AppDim.medium),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.all(AppConstants.radius),
                                border: Border.all(color: AppColors.blue),
                              ),
                              child: StyleText(
                                  text: 'negative'.tr(),
                                  color: AppColors.blue,
                              ),
                            ),
                            StyleText(
                                text: ' - ${history.negativeCnt}',
                                size: AppDim.fontSizeLarge,
                                fontWeight: AppDim.weight500,
                                color: AppColors.blue,
                            ),
                          ],
                        ),

                        const Gap(AppDim.medium),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: AppDim.xSmall, horizontal: AppDim.medium),
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.all(AppConstants.radius),
                                border: Border.all(color: AppColors.red),
                              ),
                              child: StyleText(
                                text: 'positive'.tr(),
                                color: AppColors.red
                              ),
                            ),
                            StyleText(
                              text: ' - ${history.positiveCnt}',
                              size: AppDim.fontSizeLarge,
                              fontWeight: AppDim.weight500,
                              color: AppColors.red,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),

                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.greyTextColor,
                  size: AppDim.iconXSmall,
                ),
          ]
          )
      ),
    );
  }

}