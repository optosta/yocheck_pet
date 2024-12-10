import 'package:flutter/material.dart';

import '../../../../common/common.dart';
import '../../widgets/scaffold/frame_scaffold.dart';
import '../../widgets/style_text.dart';

class VersionView extends StatelessWidget {
  const VersionView({super.key});

  String get title => '앱버전';

  @override
  Widget build(BuildContext context) {
    return FrameScaffold(
      appBarTitle: 'app_version'.tr(),
      body: Center(
        child: StyleText(
          text: '${'current_version'.tr()} ${Texts.appVersion}',
          color: AppColors.greyTextColor,
          size: AppDim.fontSizeLarge,
        ),
      ),
    );
  }
}
