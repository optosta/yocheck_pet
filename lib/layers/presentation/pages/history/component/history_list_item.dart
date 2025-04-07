import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/common/utils/snackbar_utils.dart';
import 'package:yocheck_pet/common/utils/text_format.dart';
import 'package:yocheck_pet/layers/presentation/pages/history/history_viewmodel.dart';

import '../../../../entity/history_dto.dart';
import '../../../enums/pos_neg_type.dart';
import '../../../routes/route_path.dart';
import '../../../widgets/frame_container.dart';
import '../../../widgets/style_text.dart';
import '../../../widgets/w_custom_dialog.dart';
import '../../result/result_view.dart';

class HistoryListItem extends StatelessWidget {
  final HistoryDataDTO history;

  const HistoryListItem({
    Key? key,
    required this.history,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<HistoryViewModel>(context, listen: false);

    return InkWell(
      /// 아이템 클릭 시 이벤트 처리
      onTap: () =>
          viewModel.getUrineResultDio(history.datetime).then((urineStatus) => {
                if (urineStatus.isNotEmpty && urineStatus.length == 11){
                    context.push(RoutePath.result, extra: {
                      'urineStatus': urineStatus,
                      'testDate': history.datetime,
                    })
                  }
                else {
                    //TODO: 영문으로 변경해야됨
                    SnackBarUtils.showPrimarySnackBar(
                        context, 'data_erorr'.tr())
                  }
              }),
      child: FrameContainer(
        margin: const EdgeInsets.only(top: AppDim.medium),
        backgroundColor: AppColors.white,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyleText(
                    text: TextFormat.convertTimestamp(history.datetime),
                    color: AppColors.blackTextColor,
                    size: AppDim.fontSizeLarge,
                    fontWeight: AppDim.weight400,
                    maxLinesCount: 1,
                  ),
                  AppDim.heightSmall,
                  Row(
                    children: [
                      _buildStatusLabel(
                          PosNegType.negative, history.negativeCnt),
                      AppDim.widthSmall,
                      _buildStatusLabel(
                          PosNegType.positive, history.positiveCnt),
                    ],
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  CustomDialog.showDeleteDialog(
                    title: 'delete_history'.tr(),
                    date: '${TextFormat.convertTimestamp(history.datetime)}',
                    text: 'delete_content'.tr(),
                    mainContext: context,
                    onPressed: () => {
                      context.read<HistoryViewModel>().deleteHistory(history.datetime),
                      Nav.doPop(context)
                    },
                  );
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.delete,
                    color: AppColors.grey,
                    size: AppDim.iconSmall,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _buildStatusLabel(PosNegType type, String count) {
    return Row(
      children: [
        Container(
          constraints: const BoxConstraints(
            maxWidth: 95,
            minHeight: 20,
          ),
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: type.backgroundColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 2),
            child: StyleText(
              text: type.label,
              color: type.textColor,
              fontWeight: AppDim.weightBold,
              maxLinesCount: 2,
              softWrap: true,
              align: TextAlign.center,
            ),
          ),
        ),
        AppDim.widthSmall,
        StyleText(
          text: count,
          size: AppDim.fontSizeXLarge,
          fontWeight: AppDim.weight500,
          color: type.textColor,
        ),
      ],
    );
  }
}
