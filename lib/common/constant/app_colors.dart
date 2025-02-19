import 'package:flutter/material.dart';

class AppColors {

  static Color primaryColor = const Color(0xff123734);
  static Color secondColor = const Color(0xff428C4E);

  static Color signupButtonBg = const Color(0xffE7EDEB);

  static const Color whiteTextColor = Color(0xffF5F5F5);
  static const Color blackTextColor = Color(0xff1E1E1E);
  static Color greyTextColor = const Color.fromARGB(255, 139, 139, 139);
  static Color greyColor = const Color(0xFF767676);

  static Color signupTextFieldBg = const Color(0xffF2F2F2);
  static Color containerBg = const Color(0xfff4f4f4);
  static Color boxBgColor = const Color(0xffF5F5F5);

  static const Color isActiveColor = Color(0xffb7bfff);
  static const Color isUnableColor = Color(0xffdddddd);

  static const Color posBgColor = Color(0xFFFFECDF);
  static const Color negBgColor = Color(0xFFD6FFD1);
  static const Color posTextColor = Color(0xFFFFAC4E);
  static const Color negTextColor = Color(0xFF3EA83B);

  static const Color tabGgColor = Color(0xFFE7EDEB);


  static Color shadowColor = Colors.grey.withOpacity(0.5);

  static Color selectedCalenderColor = const Color(0xFF000000);
  static Color lightBackgroundColor = const Color(0xFFF1F0F5);
  static Color toDayCalenderColor = const Color.fromARGB(255, 139, 139, 139);

  static const Color transparent = Color(0x00FFFFFF);
  static const Color veryDarkGrey = Color.fromARGB(255, 25, 25, 25);
  static const Color darkGrey = Color.fromARGB(255, 45, 45, 45);
  static const Color heightGrey = Color.fromARGB(255, 80, 80, 80);
  static const Color grey = Color.fromARGB(255, 139, 139, 139);
  static const Color middleGrey = Color.fromARGB(255, 180, 180, 180);
  static const Color white = Color(0xFFFFFFFF);
  static const Color brightGrey = Color.fromARGB(255, 228, 228, 228);
  static const Color blueGreen = Color.fromARGB(255, 0, 185, 206);
  static const Color green = Color.fromARGB(255, 132, 206, 191);
  static const Color lightGreen = Color.fromARGB(128, 85, 200, 77);
  static const Color darkGreen = Color.fromARGB(255, 101, 160, 149);
  static const Color blue = Color.fromARGB(179, 152, 170, 255);
  static const Color brightBlue = Color(0xffEEF2FF);
  static const Color lightBlue = Color.fromARGB(255, 245, 247, 255);
  static const Color darkBlue = Color.fromARGB(255, 0, 70, 111);
  static const Color mediumBlue = Color.fromARGB(255, 60, 140, 180);
  static const Color darkOrange = Color.fromARGB(255, 222, 112, 48);
  static const Color yellow = Color.fromARGB(179, 252, 255, 0);
  static const Color faleBlue = Color.fromARGB(255, 160, 206, 222);
  static const Color salmon = Color(0xffff6666);
  static const Color red = Color(0xffff0000);

  // grey box colors
  static Color greyBoxBg = Colors.grey.shade100;
  static Color greyBoxBorder = Colors.grey.shade200;
  static Color greyDarkBoxBorder = const Color(0xffbdbdbd);

  static const LinearGradient buttonGradient = LinearGradient(
      colors: [
        Color.fromRGBO(143, 148, 251, 1),
        Color.fromRGBO(143, 148, 251, .7),
      ]
  );
  // blood result box background color
  static const bloodResultBgColor = Color(0xFFfcedee);

  // health chart
  static const sleepChartColor = Color(0xFF9BA3EA);
  static const stepChartColor = Color(0xFFEFC568);


  /// 소변 분석 단계별 컬러 값
  static const resultColor1 = Color(0xFF619F61); // 안심
  static final resultColor2 = Colors.blue.shade600;  // 관심
  static const resultColor3 = Color(0xFFFFA200); // 주의
  static final resultColor4 = Colors.purple.shade500; // 위험
  static final resultColor5 = Colors.red.shade500; // 심각
  static final resultExceptColor = Colors.grey.shade600; // 이외(PH, 비중, 비타민)
  static final resultVitaminColor = Colors.grey.shade600; // 이외(PH, 비중, 비타민)

  /// 소변 분석 단계별 Text BG 컬러 값
  static const resultBGColor1 = Color(0xFFD6F9DA); // 안심
  static final resultBGColor2 = Colors.blue.shade100; // 관심
  static const resultBGColor3 = Color(0xffffe4c6); // 주의
  static final resultBGColor4 = Colors.purple.shade100; // 위험
  static final resultBGColor5 = Colors.red.shade100; // 위험
  static final resultBGExceptColor = Colors.grey.shade300; // 이외(PH, 비중, 비타민)
  static final resultBGVitaminColor = Colors.yellow.shade100; // 이외(PH, 비중, 비타민)


  /// 소변 분석 단계별 Text BG 컬러 값
  static const resultChartColor1 =  Color(0xFF2CCC3F); // 관심F
  static final resultChartColor2 = Colors.blue.shade400; // 안심
  static const resultChartColor3 = Color(0xffffd18e); // 주의
  static const resultChartColor4 = Color(0xffff4a51); // 위험
  static final resultChartExceptColor = Colors.grey.shade200; // 이외(PH, 비중, 비타민)

  /// 소변 분석 단계별 컬러 값 not used
  static const urineStageColor1 = Color(0xFF7FD697); // 관심
  static const urineStageColor2 = Color(0xFF5B85FF); // 안심
  static const urineStageColor3 = Color(0xFFFFD864); // 주의
  static const urineStageColor4 = Color(0xFF905BFF); // 위험
  static const urineStageColor5 = Color(0xFFFF5B65); // 심각
  static const urineExceptColor = Color(0xFFFF95A0); // 이외(PH, 비중, 비타민)

  /// 소변 분석 단계별 컬러 값
  //   static const resultColor1 = Color(0xffa0cb63); // 안심
  //   static const resultColor2 = Color(0xff99b8e1); // 관심
  //   static const resultColor3 = Color(0xffe6b073); // 주의
  //   static const resultColor4 = Color(0xffbb85da); // 위험
  //   static const resultColor5 = Color(0xffd88d8d); // 심각
  //   static const resultColor6 = Color(0xffffc0cb); // 이외(PH, 비중, 비타민)


  /// 파이 차트 단계별 컬러
  static const urinePieColor1 = Color(0xFF7FD697); // 안심
  static const urinePieColor2 = Color(0xFF5B85FF); // 관심
  static const urinePieColor3 = Color(0xFFFFD864); // 주의
  static const urinePieColor4 = Color(0xFF905BFF); // 위험
  static const urinePieColor5 = Color(0xFFFF5B65); // 심각
  static const urinePiExceptColor = Color(0xFFFF95A0); // 이외(PH, 비중, 비타민)

  static const List<List<Color>> level2Colors = [
    [Color(0xFFBCEDC3), Color(0xFFEDEDED),],
    [Color(0xFFEDEDED), Color(0xFF79BBEA),],
  ];

  static const List<List<Color>> level5Colors = [
    [Color(0xFFBCEDC3), Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFEDEDED),],
    [Color(0xFFEDEDED), Color(0xFF79BBEA), Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFEDEDED),],
    [Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFF8C096), Color(0xFFEDEDED), Color(0xFFEDEDED),],
    [Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFA063FF), Color(0xFFEDEDED),],
    [Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFFF7F7F),],
  ];

  static const List<List<Color>> levelGrayColors = [
    [Color(0xFF8C8C8C), Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFEDEDED),],
    [Color(0xFFEDEDED), Color(0xFF8C8C8C), Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFEDEDED),],
    [Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFF8C8C8C), Color(0xFFEDEDED), Color(0xFFEDEDED),],
    [Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFF8C8C8C), Color(0xFFEDEDED),],
    [Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFFEDEDED), Color(0xFF8C8C8C),],
  ];
}
