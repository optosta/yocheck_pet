import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/common/utils/branch.dart';
import 'package:yocheck_pet/layers/presentation/pages/ingredient/w_disease_box.dart';
import 'package:yocheck_pet/layers/presentation/pages/ingredient/w_ingredient_header.dart';
import 'package:yocheck_pet/layers/presentation/pages/ingredient/w_result_content_box.dart';
import 'package:yocheck_pet/layers/presentation/pages/ingredient/w_vitamin_info_box.dart';

import '../../../../common/utils/my_logger.dart';
import '../../../model/enum/ai_analysis_results.dart';
import '../../widgets/scaffold/frame_scaffold.dart';


/// 성분 분석 결과 화면
/// 한밭대에서 구현된 AI API 호출 기반으로 생성된 화면입니다.
class IngredientResultView extends StatefulWidget {
  final String resultText;
  final List<String> statusList;

  const IngredientResultView({
    super.key,
    required this.resultText,
    required this.statusList,
  });

  @override
  State<IngredientResultView> createState() => _IngredientResultViewState();
}

class _IngredientResultViewState extends State<IngredientResultView> {
  late AiAnalysisResults resultContent;

  @override
  void initState() {
    resultContent = Branch.aiAnalysisToContent(widget.resultText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FrameScaffold(
      appBarTitle: 'result_analysis'.tr(),
      backgroundColor: AppColors.greyBoxBg,
      bodyPadding: const EdgeInsets.all(0),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

            /// 성분 분석 결과 헤더
            IngredientHeader(
              disease: resultContent.name,
              statusList: widget.statusList,
            ),
            //const Gap(AppDim.small),


            /// 성분 관련 질환 더보기
            const DiseaseBox(),
           // const Gap(AppDim.small),

            /// 비타민 검출 영향 -> 요로감염 체크로 변경
            /// 백혈구, 아질산염항목으로 변경
            VitaminInfoBox(
             status1: widget.statusList[9],
             status2: widget.statusList[5],
            ),

            /// 예상증상 결과 내용
            //const Gap(AppDim.small),
            ResultContentBox(
              title: 'symptoms'.tr(),
              content: resultContent.symptomContent.tr(),
            ),

            /// 건강관리 가이드 결과 내용
           // const Gap(AppDim.small),
            ResultContentBox(
              title: 'health_care_guide'.tr(),
              content: resultContent.diseaseContent.tr(),
            ),

            const Gap(AppDim.xXLarge),
          ],
        ),
      ),
    );
  }
}
