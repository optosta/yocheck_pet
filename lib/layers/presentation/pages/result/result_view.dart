import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/pages/home/ai_analysis_provider.dart';

import '../../../../common/utils/my_logger.dart';
import '../../../../common/utils/text_format.dart';

import '../../widgets/style_text.dart';
import '../../widgets/ui_helper.dart';
import 'component/result_item.dart';

/// 검사 결과 화면 (검사기와 검사후, 히스토리에서 터치 이벤트시)
///TODO: 보라색 이미지 필요
///TODO: 성분분석 기능 연결
class UrineResultView extends StatefulWidget {
  /// 검사 결과 리스트
  final List<String> urineList;

  /// 검사 날짜
  final String testDate;

  const UrineResultView({
    super.key,
    required this.urineList,
    required this.testDate,
  });

  @override
  State<UrineResultView> createState() => _UrineResultViewState();
}

class _UrineResultViewState extends State<UrineResultView> {
  @override
  Widget build(BuildContext context) {
    logger.d('testDate: ${widget.testDate}');

    return ChangeNotifierProvider(
      create: (BuildContext context) => AiAnalysisProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
            elevation: 0.0,
            title: StyleText(
              text: 'result_title'.tr(),
              size: AppDim.fontSizeLarge,
              color: AppColors.primaryColor,
              fontWeight: AppDim.weightBold,
            ),
            iconTheme: const IconThemeData(color: AppColors.darkGrey),
            centerTitle: true,
          ),
          backgroundColor: AppColors.containerBg,
          body: Padding(
            padding: const EdgeInsets.all(AppDim.medium),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StyleText(
                    text: TextFormat.convertTimestamp(widget.testDate),
                    color: AppColors.blackTextColor,
                    size: AppDim.fontSizeLarge,
                    fontWeight: AppDim.weight600,
                    maxLinesCount: 1,
                  ),
                  AppDim.heightMedium,

                  SizedBox(
                    height: 400,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 11,
                      itemBuilder: (BuildContext context, int index) {

                        if((index >= 0 && index <= 6) || index == 9){
                          return UrineResultListItem(
                            status: widget.urineList[index],
                            index: index,
                          );
                        } else {
                          return const SizedBox.shrink(); // 아무것도 렌더링 하지 않음
                        }
                      },
                    ),
                  ),
                  AppDim.heightXLarge,

                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 11,
                      itemBuilder: (BuildContext context, int index) {
                        if(index == 7 || index == 8 || index == 10){
                          return UrineResultListItem(
                            status: widget.urineList[index],
                            index: index,
                          );
                        } else {
                          return const SizedBox.shrink(); // 아무것도 렌더링 하지 않음
                        }
                      },
                    ),
                  ),


                ],
              ),
            ),
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: AppDim.small),
            child: FloatingActionButton.extended(
              shape: RoundedRectangleBorder(
                borderRadius: AppConstants.borderLightRadius,
              ),
              backgroundColor: AppColors.secondColor,
              foregroundColor: Colors.black,
              onPressed: () =>  context.read<AiAnalysisProvider>().fetchAiAnalyze(
                showLoadingDialog: () => UiHelper.showAiAnalysisDialog(context),
                showErrorDialog: (message) => UiHelper.showErrorDialog(context, message),
                statusList: widget.urineList,
                navigateToResult: (resultText, statusList) {
                  context.pop(); // 소변 검사 결과 화면 pop
                  context.push('/ingredientResult', extra: {
                    'resultText': resultText,
                    'statusList': statusList
                  }); // 성분 분석 결과 페이지로 이동
                },
              ),
              icon: const Icon(Icons.add_chart_sharp, color: AppColors.white,),
              label: StyleText(
                text: 'button_ingredient'.tr(),
                color: AppColors.whiteTextColor,
              ),
            ),
          ),
        );
      },
    );
  }
}
