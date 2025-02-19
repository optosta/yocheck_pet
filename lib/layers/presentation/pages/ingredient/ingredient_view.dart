import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/common/utils/branch.dart';
import 'package:yocheck_pet/layers/presentation/pages/ingredient/component/ingredient_header.dart';
import 'package:yocheck_pet/layers/presentation/pages/ingredient/component/result_content_box.dart';
import 'package:yocheck_pet/layers/presentation/pages/ingredient/component/vitamin_info_box.dart';

import '../../../model/enum/ai_analysis_results.dart';
import '../../routes/route_path.dart';
import '../../widgets/scaffold/frame_scaffold.dart';
import '../../widgets/style_text.dart';


/// 성분 분석 결과 화면
/// 한밭대에서 구현된 AI API 호출 기반으로 생성된 화면입니다.
class IngredientView extends StatefulWidget {
  final String resultText;
  final List<String> statusList;

  const IngredientView({
    super.key,
    required this.resultText,
    required this.statusList,
  });

  @override
  State<IngredientView> createState() => _IngredientViewState();
}

class _IngredientViewState extends State<IngredientView> {
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

            /// 비타민 검출 영향 -> 요로감염 체크로 변경
            /// 백혈구, 아질산염항목으로 변경
            VitaminInfoBox(
             status1: widget.statusList[9],
             status2: widget.statusList[5],
            ),

            /// 예상증상 결과 내용
            ResultContentBox(
              title: 'symptoms'.tr(),
              content: resultContent.symptomContent.tr(),
            ),

            /// 건강관리 가이드 결과 내용
            ResultContentBox(
              title: 'health_care_guide'.tr(),
              content: resultContent.diseaseContent.tr(),
            ),
            AppDim.heightMedium,

            GestureDetector(
              onTap: () => context.push(RoutePath.diseaseinfo),
              child: Container(
                height: AppConstants.buttonHeight50,
                margin: const EdgeInsets.symmetric(horizontal: AppDim.large),
                decoration: BoxDecoration(
                  borderRadius: AppConstants.borderLightRadius,
                  border: Border.all(
                    color: AppColors.primaryColor,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StyleText(
                      text: 'view_disease_info'.tr(),
                      color: AppColors.primaryColor,
                      size: AppDim.fontSizeLarge,
                      fontWeight: AppDim.weight500,
                    )
                  ],
                ),
              ),
            ),

            const Gap(AppDim.xXLarge),

          ],
        ),
      ),
    );
  }
}
