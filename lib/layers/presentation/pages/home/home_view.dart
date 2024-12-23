import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/layers/model/authorization.dart';
import 'package:yocheck_pet/layers/presentation/pages/home/ai_analysis_provider.dart';
import 'package:yocheck_pet/layers/presentation/pages/home/component/home_body.dart';
import 'package:yocheck_pet/layers/presentation/pages/home/home_viewmodel.dart';

import '../../../../common/common.dart';
import '../../../../common/utils/my_logger.dart';
import '../../routes/route_path.dart';
import 'component/home_appbar.dart';
import 'component/home_header.dart';

/// 소변검사 메인 화면
//TODO: 한글 영문 처리 해야됨
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _UrineHomeViewState();
}

class _UrineHomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        onPressed: () => context.push(RoutePath.setting),
      ),
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) => HomeViewModel(),
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => AiAnalysisProvider(),
          ),
        ],
        child: Container(
          decoration: BoxDecoration(
            gradient: AppConstants.gradient,
          ),
          child: const SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 소변검사 헤더
                HomeHeader(),

                /// 버튼 4개(검사진행, 검사내역, 성분분석, 나의 추이)
                HomeBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
