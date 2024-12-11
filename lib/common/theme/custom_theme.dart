import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/common/theme/color/dark_app_colors.dart';
import 'package:yocheck_pet/common/theme/color/light_app_colors.dart';
import 'package:yocheck_pet/common/theme/shadows/dart_app_shadows.dart';
import 'package:yocheck_pet/common/theme/shadows/light_app_shadows.dart';
import 'package:flutter/material.dart';

enum CustomTheme {
  dark(
    DarkAppColors(),
    DarkAppShadows(),
  ),
  light(
    LightAppColors(),
    LightAppShadows(),
  );

  const CustomTheme(this.appColors, this.appShadows);

  final AbstractThemeColors appColors;
  final AbsThemeShadows appShadows;

  ThemeData get themeData {
    switch (this) {
      case CustomTheme.dark:
        {
          return darkTheme;
        }
      case CustomTheme.light:
        {
          return lightTheme;
        }
      default:
        {
          return lightTheme;
        }
    }
  }
}

/// 라이트 테마
ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.white,
  colorScheme: ColorScheme.light(
    primary: AppColors.primaryColor,
    onPrimary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    onSecondary: Colors.blue,
    error: Colors.red,
    onError: Colors.redAccent,
    background: AppColors.lightBackgroundColor,
    onBackground: Colors.orange,
    surface: AppColors.veryDarkGrey,
    onSurface: AppColors.grey,
    outline: AppColors.white,
  ),
);

/// 다크 테마
ThemeData darkTheme = ThemeData(
  useMaterial3: false,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.veryDarkGrey,
  colorScheme: ColorScheme.dark(
    primary: AppColors.primaryColor,
    onPrimary: AppColors.primaryColor,
    secondary: AppColors.primaryColor,
    onSecondary: Colors.blue,
    brightness: Brightness.dark,
    error: Colors.red,
    onError: Colors.redAccent,
    background: AppColors.heightGrey,
    onBackground: Colors.orange,
    surface: AppColors.white,
    onSurface: AppColors.grey,
    surfaceVariant: AppColors.middleGrey,
    outline: AppColors.heightGrey,
  ),
);
