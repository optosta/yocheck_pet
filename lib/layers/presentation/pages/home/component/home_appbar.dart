import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yocheck_pet/common/common.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback onPressed;

  const HomeAppBar({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: preferredSize,
      child: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.white),
        title: Image.asset(
          '${Texts.imagePath}/urine/home/logo_icon.png',
          color: AppColors.primaryColor,
          height: AppDim.large,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.grey.shade600),
        actions: [
          /// 채팅화면 우측 상단 아이콘 버튼
          Padding(
            padding: const EdgeInsets.only(right: AppDim.medium),
            child:  GestureDetector(
                onTap: () => onPressed(),
                child: Image.asset('${Texts.imagePath}/urine/home/setting_icon.png', width: AppDim.iconSmall,),
            )
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
