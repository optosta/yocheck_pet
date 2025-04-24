
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/layers/model/authorization.dart';
import 'package:yocheck_pet/layers/presentation/pages/setting/footer_box.dart';
import 'package:yocheck_pet/layers/presentation/pages/setting/version/v_version.dart';
import 'package:yocheck_pet/layers/presentation/pages/setting/setting_viewmodel.dart';

import '../../../../common/common.dart';
import '../../../../common/utils/snackbar_utils.dart';
import '../../../domain/usecase/auth_usecase.dart';
import '../../routes/route_path.dart';
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
    return  FrameScaffold(
          appBarTitle: 'setting'.tr(),
          bodyPadding: EdgeInsets.zero,
          body: Stack(
            children: [
              Container(
                alignment: Alignment.topCenter,
                margin: const EdgeInsets.all(AppDim.medium),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      visible: Authorization().userID == 'sim3383' ? true : false,
                      child: _buildMenu('관리자', context),
                    ),
                    _buildMenu('version_info'.tr(), context),
                    _buildMenu('trm_policy'.tr(), context),
                    _buildMenu('opensource_license'.tr(), context),
                    _buildMenu('user_delete'.tr(), context),
                    _buildMenu('logout'.tr(), context),
                    AppDim.heightXXLarge,
                  ],
                ),
              ),

              const Align(
                  alignment: Alignment.bottomCenter,
                  child: FooterBox(),
              ),
            ],
          ),
        );
  }

  /// Menu item widget
  _buildMenu(String text, BuildContext context) {
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
            } else if (text == 'user_delete'.tr()) {
              CustomDialog.showSettingDialog(
                  title: 'user_delete'.tr(),
                  text: 'user_delete_content'.tr(),
                  mainContext: context,
                  onPressed: () => deleteUser(context)
              );
            } else if (text == 'logout'.tr()) {
              CustomDialog.showSettingDialog(
                title: 'logout'.tr(),
                text: 'logout_content'.tr(),
                mainContext: context,
                onPressed: () => _performLogoutSuccess(context)
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
  }
  /// 로그아웃 성공 처리
  _performLogoutSuccess(BuildContext context) {
    Authorization().clean();
    SnackBarUtils.showPrimarySnackBar(
      context,
      'logout_success'.tr(),
    );
    context.go(RoutePath.login);
  }

  Future<void> deleteUser(BuildContext context) async {
    Nav.doPop(context); // 회원탈퇴 다이얼로그 닫기

    final result = await DeleteUserUseCase().execute();
    if (result  == '200' && context.mounted) {
      Authorization().clean();
      SnackBarUtils.showPrimarySnackBar(
        context,
        'delete_user_success'.tr(),
      );
      context.go(RoutePath.login);
    } else {
      SnackBarUtils.showPrimarySnackBar(
        context,
        'delete_user_fail'.tr(),
      );
    }

  }
}
