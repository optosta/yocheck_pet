
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/layers/model/authorization.dart';
import 'package:yocheck_pet/layers/presentation/pages/setting/version/v_version.dart';
import 'package:yocheck_pet/layers/presentation/pages/setting/setting_viewmodel.dart';

import '../../../../common/common.dart';
import '../../widgets/scaffold/frame_scaffold.dart';
import '../../widgets/style_text.dart';
import '../../widgets/w_custom_dialog.dart';
import 'manager/manager_view.dart';
import 'opensource/opensource_view.dart';
import 'terms/terms_full_view.dart';


/// 설정 화면
class SettingView extends StatefulWidget   {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView>{

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => SettingViewModel(),
      child: FrameScaffold(
        appBarTitle: 'setting'.tr(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: AppDim.small),
            child: Column(
              children:
              [

                 Visibility(
                   visible: Authorization().userID == 'sim3383' ? true : false,
                   child: _buildMenu('관리자'),
                 ),
                _buildMenu('version_info'.tr()),
                _buildMenu('trm_policy'.tr()),
                _buildMenu('opensource_license'.tr()),
                _buildMenu('logout'.tr()),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Menu item widget
  _buildMenu(String text) {
    return Consumer<SettingViewModel>(
      builder: (context, provider, child) {
        return InkWell(
          onTap: () {
            if (text == '관리자') {
              Nav.doPush(context, const ManagerView());
            } else if (text == 'version_info'.tr()) {
              Nav.doPush(context, const VersionView());
            } else if (text == 'trm_policy'.tr()) {
              Nav.doPush(context, TermsFullView());
            } else if (text == 'opensource_license'.tr()) {
              Nav.doPush(context, const OpensourceView());
            } else if (text == 'logout'.tr()) {
              CustomDialog.showSettingDialog(
                title: 'logout'.tr(),
                text: 'logout_content'.tr(),
                mainContext: context,
                onPressed: () => provider.logout(context),
              );
            }
          },
          child: Column(
            children: [
              Container(
                height: 60,
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  border: Border(bottom: BorderSide(
                    color: AppColors.grey,
                    width: 0.1,
                  )),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:
                  [
                    StyleText(
                      text: text,
                      size: AppDim.fontSizeSmall,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.grey,
                      size: AppDim.iconXSmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
