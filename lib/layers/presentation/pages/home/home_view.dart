
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/layers/presentation/pages/home/ai_analysis_provider.dart';
import 'package:yocheck_pet/layers/presentation/pages/home/component/home_body.dart';
import 'package:yocheck_pet/layers/presentation/pages/home/home_viewmodel.dart';

import '../../../../common/common.dart';
import '../setting/setting_view.dart';
import 'component/home_appbar.dart';
import 'component/home_bg_layout.dart';
import 'component/home_header.dart';
import 'component/home_lower.dart';


/// 소변검사 메인 화면
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _UrineHomeViewState();
}

class _UrineHomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(onPressed: ()=> Nav.doPush(context, const SettingView())),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (BuildContext context) => HomeViewModel()),
          ChangeNotifierProvider(create: (BuildContext context) => AiAnalysisProvider()),
        ],
        child: const SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: HomeBackgroundLayout(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      /// 소변검사 헤더
                      HomeHeader(),
                      Gap(AppDim.large),

                      /// 버튼 4개(검사진행, 검사내역, 성분분석, 나의 추이)
                      HomeBody(),
                    ],
                  ),
                ),
              ),

              /// 하단 이미지
              Align(
                  alignment: Alignment.bottomCenter,
                  child: HomeLower(),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
