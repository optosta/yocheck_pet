import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/pages/result/result_viewmodel.dart';
import 'package:yocheck_pet/layers/presentation/pages/result/component/result_item.dart';

import '../../../../common/utils/text_format.dart';
import '../../widgets/default_button.dart';
import '../../widgets/result_item_box.dart';
import '../../widgets/scaffold/frame_scaffold.dart';
import '../../widgets/style_text.dart';

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
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 11,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //1 개의 행에 보여줄 item 개수
                  childAspectRatio: 1.5 / 0.95, //item 의 가로 1, 세로 1 의 비율
                  mainAxisSpacing: 13, //수평 Padding
                  crossAxisSpacing: 13, //수직 Padding
                ),
                itemBuilder: (BuildContext context, int index) {
                  // return Text(index.toString());
                  return ResultItemBox(
                    index: index,
                    status: widget.urineList[index],
                  );
                },
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
          onPressed: () {
            //provider.fetchAiAnalyze(widget.urineList);
          },
          icon: const Icon(Icons.add_chart_sharp, color: AppColors.white),
          //TODO: 영문 변환 해야됨
          label: const StyleText(text:'성분분석 의뢰', color: AppColors.whiteTextColor,),
        ),
      ),
    );

  }
}
