import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/common/util/branch.dart';
import 'package:yocheck_pet/layers/presentation/ingredient/w_disease_box.dart';
import 'package:yocheck_pet/layers/presentation/ingredient/w_ingredient_header.dart';
import 'package:yocheck_pet/layers/presentation/ingredient/w_result_content_box.dart';
import 'package:yocheck_pet/layers/presentation/ingredient/w_vitamin_info_box.dart';
import 'package:yocheck_pet/layers/presentation/widget/scaffold/frame_scaffold.dart';

import '../../model/enum/ai_analysis_results.dart';

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

  String get title => '성분분석';
  String get symptomTitle => '✓ 예상 증상';
  String get diseaseTitle => '✓ 건강관리 가이드';
  String get ingredientAnalysisText => '성분 관련 질환 더보기';

  @override
  void initState() {
    resultContent = Branch.aiAnalysisToContent(widget.resultText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FrameScaffold(
      appBarTitle: title,
      backgroundColor: AppColors.greyBoxBg,
      bodyPadding: const EdgeInsets.all(0),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [

            /// 성분 분석 결과 헤더
            IngredientHeader(
              disease: widget.resultText,
              statusList: widget.statusList,
            ),
            const Gap(AppDim.small),


            /// 성분 관련 질환 더보기
            const DiseaseBox(),
            const Gap(AppDim.small),

            /// 비타민 검출 영향 -> 요로감염 체크로 변경
            /// 백혈구, 아질산염항목으로 변경
            VitaminInfoBox(
             status1: widget.statusList[9],
             status2: widget.statusList[5],
            ),

            /// 예상증상 결과 내용
            const Gap(AppDim.small),
            ResultContentBox(
              title: symptomTitle,
              content: resultContent.symptomContent,
            ),

            /// 예상 질병 결과 내용
            const Gap(AppDim.small),
            ResultContentBox(
              title: diseaseTitle,
              content: resultContent.diseaseContent,
            ),

            const Gap(AppDim.xXLarge),
          ],
        ),
      ),
    );
  }
}
