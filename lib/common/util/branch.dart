
import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../layers/model/enum/ai_analysis_results.dart';
import '../../layers/model/enum/blood_data_type.dart';

/// 분기 계산 클래스
class Branch {

  /// AI 분석 결과에 맞는 텍스트 내용으로 변환
  static AiAnalysisResults aiAnalysisToContent(String resultText) {
    String result = resultText.split(',')[0];

    if(result == '만성신장질환'){
      return AiAnalysisResults.kidneys;
    } else if(result == '방광염'){
      return AiAnalysisResults.bladder;
    } else if(result == '췌장염'){
      return AiAnalysisResults.pancreas;
    } else if(result == '빈혈'){
      return AiAnalysisResults.anemia;
    } else if(result == '당뇨'){
      return AiAnalysisResults.diabetes;
    } else if(result == '신장염'){
      return AiAnalysisResults.nephritis;
    } else if(result == '다낭성신장염'){
      return AiAnalysisResults.polycysticnephritis;
    } else if(result == '급성간염'){
      return AiAnalysisResults.acutehepatitis;
    } else if(result == '갑상선기능항진증'){
      return AiAnalysisResults.hyperthyroidism;
    } else if(result == '간염(A형)'){
      return AiAnalysisResults.hepatitis;
    } else if(result == '신장질환' || result == '신우염' || result == '신부전'){
      return AiAnalysisResults.kidneydisease;
    } else {
      return AiAnalysisResults.health;
    }
  }

  static statusToVitaminText(String status){
    switch(status){
      case '0' : return '-';
      case '1' : return '+';
      case '2' : return '++';
      case '3' : return '+++';
      default  : return '-';
    }
  }

  static resultStatusToText(String status, int index){
    if(index == 8){ // 비중
      switch(status){
        case '0' : return '1.000';
        case '1' : return '1.005';
        case '2' : return '1.010';
        case '3' : return '1.020';
        case '4' : return '1.025';
        default  : return '1.030';
      }
    }

    else if(index == 10){ // 비타민
      switch(status){
        case '0' : return '-';
        case '1' : return '+';
        case '2' : return '++';
        case '3' : return '+++';
        default  : return '-';
      }
    }

    else if(index == 7){ // PH
      switch(status){
        case '0' : return '음성';
        case '1' : return '산성';
        case '2' : return '중성';
        case '3' : return '알칼리성';
        case '4' : return '강알칼리성';
        default  : return '-';
      }
    }

    else if(index == 0 || index == 1 || index == 9){ // 잠혈, 빌리루빈, 백혈구
      switch(status){
        case '0' : return '안심';
        case '1' : return '관심';
        case '2' : return '주의';
        case '3' : return '위험';
        default  : return '-';
      }
    }

    else if(index == 2){ // 우로빌리노겐
      switch(status){
        case '0' : return '안심';
        case '1' : return '관심';
        case '2' : return '주의';
        case '3' : return '위험';
        case '4' : return '심각';
        default  : return '-';
      }
    }

    else if(index == 3) { // 케톤체
      switch(status){
        case '0' : return '안심';
        case '1' : return '관심';
        case '2' : return '주의';
        case '3' : return '위험';
        default  : return '안심';
      }
    }

    else if(index == 4 ) { // 단백질, 포도당
      switch(status){
        case '0' : return '안심';
        case '1' : return '관심';
        case '2' : return '주의';
        case '3' : return '위험';
        case '4' : return '심각';
        default  : return '안심';
      }
    }

    else if(index == 6) { // 단백질, 포도당
      switch(status){
        case '0' : return '0gm/dl';
        case '1' : return '100mg/dl';
        case '2' : return '250mg/dl';
        case '3' : return '500mg/dl';
        case '4' : return '1000mg/dl';
        default  : return '-';
      }
    }

    else if(index == 5) { // 아질산염
      switch(status){
        case '0' : return '안심';
        case '1' : return '관심';
        default  : return '안심';
      }
    }

  }

  static resultStatusToIconData(String status, int index){
    if(index == 10 || index == 8 || index == 7){
      return Icons.sentiment_satisfied;
    } else {
      switch(status){
        case '0' : return  Icons.sentiment_satisfied_alt;
        case '1' : return  Icons.sentiment_satisfied_alt;
        case '2' : return  Icons.sentiment_neutral;
        case '3' : return  Icons.sentiment_dissatisfied;
        case '4' : return  Icons.sentiment_dissatisfied_rounded;
        case '5' : return  Icons.sentiment_dissatisfied_rounded;
        default  : return  Icons.sentiment_neutral;
      }
    }
  }


  static resultStatusToImageStr(String status, int index){
    if(index == 10){ // 비타민
      switch(status){
        case '0' : return '${Texts.imagePath}/urine/result/plus_1.png';
        case '1' : return '${Texts.imagePath}/urine/result/plus_1.png';
        case '2' : return '${Texts.imagePath}/urine/result/plus_2.png';
        case '3' : return '${Texts.imagePath}/urine/result/plus_3.png';
        default  : return '${Texts.imagePath}/urine/result/plus_1.png';
      }
    }

    else if(index == 7) { // PH
      switch(status){
        case '0' : return '${Texts.imagePath}/urine/result/plus_1.png';
        case '1' : return '${Texts.imagePath}/urine/result/plus_1.png';
        case '2' : return '${Texts.imagePath}/urine/result/plus_1.png';
        case '3' : return '${Texts.imagePath}/urine/result/plus_2.png';
        case '4' : return '${Texts.imagePath}/urine/result/plus_3.png';
        default  : return '${Texts.imagePath}/urine/result/plus_1.png';
      }
    }

    else if(index == 8) { // 비중
      switch(status){
        case '0' : return '${Texts.imagePath}/urine/result/plus_1.png';
        case '1' : return '${Texts.imagePath}/urine/result/plus_1.png';
        case '2' : return '${Texts.imagePath}/urine/result/plus_2.png';
        case '3' : return '${Texts.imagePath}/urine/result/plus_3.png';
        case '4' : return '${Texts.imagePath}/urine/result/plus_4.png';
        default  : return '${Texts.imagePath}/urine/result/plus_1.png';
      }
    }

    else if(index == 0 || index == 1 || index == 9){ // 잠혈 ,빌리루빈, 백혈구
      switch(status){
        case '0' : return '${Texts.imagePath}/urine/result/step_0.png';
        case '1' : return '${Texts.imagePath}/urine/result/step_1.png';
        case '2' : return '${Texts.imagePath}/urine/result/step_2.png';
        case '3' : return '${Texts.imagePath}/urine/result/step_3.png';
        default  : return '${Texts.imagePath}/urine/result/step_0.png';
      }
    }

    else if(index == 3){ // 케톤체
      switch(status){
        case '0' : return '${Texts.imagePath}/urine/result/step_0.png';
        case '1' : return '${Texts.imagePath}/urine/result/step_1.png';
        case '2' : return '${Texts.imagePath}/urine/result/step_2.png';
        case '3' : return '${Texts.imagePath}/urine/result/step_3.png';
        default  : return '${Texts.imagePath}/urine/result/step_0.png';
      }
    }

    else if(index == 4 || index == 6){ // 단백질, 포도당
      switch(status){
        case '0' : return '${Texts.imagePath}/urine/result/step_0.png';
        case '1' : return '${Texts.imagePath}/urine/result/step_1.png';
        case '2' : return '${Texts.imagePath}/urine/result/step_2.png';
        case '3' : return '${Texts.imagePath}/urine/result/step_3.png';
        case '4' : return '${Texts.imagePath}/urine/result/step_4.png';
        default  : return '${Texts.imagePath}/urine/result/step_0.png';
      }
    }

    else if(index == 2){ // 우로 빌리노겐
      switch(status){
        case '0' : return '${Texts.imagePath}/urine/result/step_0.png';
        case '1' : return '${Texts.imagePath}/urine/result/step_1.png';
        case '2' : return '${Texts.imagePath}/urine/result/step_2.png';
        case '3' : return '${Texts.imagePath}/urine/result/step_3.png';
        case '4' : return '${Texts.imagePath}/urine/result/step_4.png';
        default  : return '${Texts.imagePath}/urine/result/step_0.png';
      }
    }

    else { // 아질산염
      switch(status){
        case '0' : return '${Texts.imagePath}/urine/result/step_0.png';
        case '1' : return '${Texts.imagePath}/urine/result/step_1.png';
        default  : return '${Texts.imagePath}/urine/result/step_0.png';
      }
    }


  }

  static resultStatusToChartLabelColor(String status, int index) {
    if (index == 10 || index == 8 || index == 7) { // ph, 비중, 비타민 예외
      return AppColors.resultChartExceptColor;
    }
    else {
      switch (status) {
        case '0':
          return AppColors.resultChartColor1;
        case '1':
          return AppColors.resultChartColor1;
        case '2':
          return AppColors.resultChartColor2;
        case '3':
          return AppColors.resultChartColor3;
        case '4':
          return AppColors.resultChartColor4;
        case '5':
          return AppColors.resultChartColor4;
        default:
          return AppColors.resultChartColor4;
      }
    }
  }


  static resultStatusToColor(String status, int index) {
    if ( index == 8 || index == 7) { // ph, 비중, 비타민 예외
      return AppColors.resultExceptColor;
    }
    else if(index == 10){ // 비타민
      return AppColors.resultVitaminColor;
    }

    else if(index == 0 || index == 1 || index == 9){ // 잠혈, 빌리루빈, 백혈구
      switch(status){
        case '0' : return AppColors.resultColor1;
        case '1' : return AppColors.resultColor2;
        case '2' : return AppColors.resultColor3;
        case '3' : return AppColors.resultColor4;
        case '4' : return AppColors.resultColor4;
        default  : return AppColors.resultColor1;
      }
    }

    else if(index == 3){ // 케톤체
      switch(status){
        case '0' : return AppColors.resultColor1;
        case '1' : return AppColors.resultColor2;
        case '2' : return AppColors.resultColor3;
        case '3' : return AppColors.resultColor4;
        default  : return AppColors.resultColor1;
      }
    }

    else if(index == 4 || index == 6) { // 단백질, 포도당
      switch (status) {
        case '0' :
          return AppColors.resultColor1;
        case '1' :
          return AppColors.resultColor2;
        case '2' :
          return AppColors.resultColor3;
        case '3' :
          return AppColors.resultColor4;
        case '4' :
          return AppColors.resultColor5;
        default :
          return AppColors.resultColor1;
      }
    }
    else if(index == 2) { // 우로빌리노겐
      switch(status){
        case '0' : return AppColors.resultColor1;
        case '1' : return AppColors.resultColor2;
        case '2' : return AppColors.resultColor3;
        case '3' : return AppColors.resultColor4;
        case '4' : return AppColors.resultColor5;
        default  : return AppColors.resultColor1;
      }
    }

    else { // 아질산염
      switch(status){
        case '0' : return AppColors.resultColor1;
        case '1' : return AppColors.resultColor2;
        default  : return AppColors.resultColor1;
      }
    }
  }

  static resultStatusToBgColor(String status, int index) {
    if ( index == 8 || index == 7) { // ph, 비중, 비타민 예외
      return AppColors.resultBGExceptColor;
    }
    else if(index == 10){ // 비타민
      return AppColors.resultBGVitaminColor;
    }

    else if(index == 0 || index == 1 || index == 9){ // 잠혈, 빌리루빈, 백혈구
      switch(status){
        case '0' : return AppColors.resultBGColor1;
        case '1' : return AppColors.resultBGColor2;
        case '2' : return AppColors.resultBGColor3;
        case '3' : return AppColors.resultBGColor4;
        default  : return AppColors.resultBGColor1;
      }
    }

    else if(index == 3){ // 케톤체
      switch(status){
        case '0' : return AppColors.resultBGColor1;
        case '1' : return AppColors.resultBGColor2;
        case '2' : return AppColors.resultBGColor3;
        case '3' : return AppColors.resultBGColor4;
        default  : return AppColors.resultBGColor1;
      }
    }

    else if(index == 4 || index == 6){ // 단백질, 포도당
      switch(status){
        case '0' : return AppColors.resultBGColor1;
        case '1' : return AppColors.resultBGColor2;
        case '2' : return AppColors.resultBGColor3;
        case '3' : return AppColors.resultBGColor4;
        case '4' : return AppColors.resultBGColor5;
        default  : return AppColors.resultBGColor1;
      }
    }

    else if(index == 2){ // 우로빌리노겐
      switch(status){
        case '0' : return AppColors.resultBGColor1;
        case '1' : return AppColors.resultBGColor2;
        case '2' : return AppColors.resultBGColor3;
        case '3' : return AppColors.resultBGColor4;
        case '4' : return AppColors.resultBGColor5;
        default  : return AppColors.resultBGColor1;
      }
    }

    else { // 아질산염
      switch(status){
        case '0' : return AppColors.resultBGColor1;
        case '1' : return AppColors.resultBGColor2;
        default  : return AppColors.resultBGColor1;
      }
    }
  }

  static resultStatusToPercent(List<String> statusResult, int index) {
      switch (statusResult[index]) {
        case '0':
          return 0.1;
        case '1':
          return 0.3;
        case '2':
          return 0.4;
        case '3':
          return 0.6;
        case '4':
          return 1.0;
        case '5':
          return 1.0;
        default:
          return 0.1;
      }
  }
  static urineLabelToUrineDataType(String urineName) {
    switch (urineName) {
      case '잠혈':
        return 'DT01';
      case '빌리루빈':
        return 'DT02';
      case '우로빌리노겐':
        return 'DT03';
      case '케톤체':
        return 'DT04';
      case '단백질':
        return 'DT05';
      case '아질산염':
        return 'DT06';
        case '포도당':
        return 'DT07';
        case '산성도':
        return 'DT08';
        case '비중':
        return 'DT09';
      case '백혈구':
        return 'DT10';
      case '비타민':
        return 'DT11';
      default:
        return 'DT00';
    }
  }

  static Color calculateBloodStatusColor(BloodDataType type, double value,
      {required Color badColor, required Color goodColor}) {
    switch (type) {
      case BloodDataType.hemoglobin:
        //TODO: gender 부분 수정해줘야됨 (type.label임시)
        if (type.label == 'M') {
          if (13.0 <= value && 16.5 >= value) {
            return goodColor;
          } else {
            return badColor;
          }
        } else {
          // 여자
          if (12.0 <= value && 15.5 >= value) {
            return goodColor;
          } else {
            return badColor;
          }
        }
      case BloodDataType.fastingBloodSugar:
        if (100 > value) {
          return goodColor;
        } else {
          return badColor;
        }
      case BloodDataType.totalCholesterol:
        if (200 > value) {
          return goodColor;
        } else {
          return badColor;
        }
      case BloodDataType.highDensityCholesterol:
        if (60 < value) {
          return goodColor;
        } else {
          return badColor;
        }
      case BloodDataType.neutralFat:
        if (150 > value) {
          return goodColor;
        } else {
          return badColor;
        }
      case BloodDataType.lowDensityCholesterol:
        if (130 > value) {
          return goodColor;
        } else {
          return badColor;
        }
      case BloodDataType.serumCreatinine:
        if (1.5 >= value) {
          return goodColor;
        } else {
          return badColor;
        }
      case BloodDataType.shinsugularFiltrationRate:
        if (60 <= value) {
          return goodColor;
        } else {
          return badColor;
        }
      case BloodDataType.astSgot:
        if (40 >= value) {
          return goodColor;
        } else {
          return badColor;
        }
      case BloodDataType.altSGpt:
        if (35 >= value) {
          return goodColor;
        } else {
          return badColor;
        }
      case BloodDataType.gammaGtp:
        //TODO: (type.label) 임시
        if (type.label == 'M') {
          if (63.0 >= value) {
            return goodColor;
          } else {
            return badColor;
          }
        } else {
          // 여자
          if (35.0 >= value) {
            return goodColor;
          } else {
            return badColor;
          }
        }
    }
  }

  static Color getBloodPressureColor(String resultText, String resultLabel) {
    Color borderColor = Colors.blueAccent;

    if(resultLabel == '청력(좌/우)') {
      if(resultText.contains('비정상') || resultText.contains('비 정상')) {
        borderColor = Colors.red;
      }
    } else if(resultLabel == '혈압') {

      List<int> values = resultText
          .split('/')
          .map((value) => int.tryParse(value.trim()) ?? 0)
          .toList();

      // 추출한 혈압 값이 유효한지 확인
      if (values.length == 2) {
        int systolic = values[0];
        int diastolic = values[1];

        // 혈압이 정상 범위인 경우 파랑색 반환
        if (systolic <= 120 && diastolic <= 80) {
          return borderColor;
        }
        // 그 외의 경우 빨간색을 반환
        else {
          return Colors.red;
        }
      } else {
        // 혈압 값이 올바르게 구성되지 않은 경우 파랑색 반환
        return borderColor;
      }
    }
    return borderColor;
  }


  /// 차트 x축 갯수에 따른 bar차트 폭 비율 리턴
  static double calculateChartWidthRatio(int length) {
    switch (length) {
      case 1:
        return 0.2;
      case 2:
        return 0.2;
      case 3:
        return 0.25;
      case 4:
        return 0.3;
      default:
        return 0.35;
    }
  }


  /// 피 검사 기준 수치 반환
  static double bloodTestStandardValue(BloodDataType type) {
    switch (type) {
      case BloodDataType.hemoglobin:
        return 0.0;
      case BloodDataType.fastingBloodSugar:
        return 100.0;
      case BloodDataType.totalCholesterol:
        return 200.0;
      case BloodDataType.highDensityCholesterol:
        return 60.0;
      case BloodDataType.neutralFat:
        return 150.0;
      case BloodDataType.lowDensityCholesterol:
        return 130.0;
      case BloodDataType.serumCreatinine:
        return 1.5;
      case BloodDataType.shinsugularFiltrationRate:
        return 60.0;
      case BloodDataType.astSgot:
        return 40.0;
      case BloodDataType.altSGpt:
        return 35.0;
      case BloodDataType.gammaGtp:
        //TODO: 임시
       // if (Authorization().gender == 'M') {
          return 63.0;
       // } else {
          // 여자
          return 35.0;
       // }
    }
  }


  /// 수면, 걷기 달성률 계산
  static calculateAchievementRate(int value, int target) {
    if (target == 0 || value == 0) {
      return 0.0;
    }

    if (value > target) {
      return 100.0;
    }

    // 달성률 계산
    double rate = (value / target) * 100;
    return rate;
  }

  /// 소변 검사 결과 등급 함수
  static String urineGradeResult(String type, double x) {
    switch (type) {
      case 'DT01': // 잠혈
        if (x >= 50 && x <= 58) return "0"; //54
        if (x >= 59 && x <= 85) return "1"; //79
        if (x >= 86 && x <= 110) return "2"; //110
        if (x >= 110.0) return "3"; //140
        break;

      case 'DT02': // 빌리루빈
        if (x >= 42) return "0"; //42
        if (x >= 39 && x <= 41) return "1"; //40
        if (x >= 34 && x <= 38) return "2"; //33
        if (x <= 33) return "3"; //25
        break;

      case 'DT03': // 우로빌리노겐
        if (x >= 43) return "0"; //44
        if (x >= 38 && x <= 42) return "1"; //41
        if (x >= 33 && x <= 37) return "2"; //32
        if (x >= 22 && x <= 32) return "3"; //23
        if (x <= 21) return "4"; //19
        break;

      case 'DT04': //케톤체
        if (x >= 41) return "0";//43
        if (x >= 30 && x <= 40) return "1"; //35
        if (x >= 26 && x <= 29) return "2"; //35
        if (x <= 25.9) return "3"; //23
        break;

      case 'DT05': //단백질
        if (x <= 55) return "0"; //53
        if (x >= 56 && x <= 72) return "1"; // 62
        if (x >= 73 && x <= 83) return "2"; //75
        if (x >= 84 && x <= 118) return "3"; //125
        if (x >= 119.0) return "4"; //149
        break;

      case 'DT06': //아질산염
        return x >= 42 ? "0" : "1"; //44,31

      case 'DT07': //포도당
        if (x >= 190) return "0"; //205
        if (x >= 103 && x <= 189) return "1"; //130
        if (x >= 72 && x <= 102) return "2"; //105
        if (x >= 29 && x <= 71) return "3"; //52
        if (x < 28) return "4"; //10
        break;

      case 'DT08': //산성도
        if (x >= 5 && x <= 28) return "0"; // 음성, 10
        if (x >= 29 && x <= 65) return "1"; // 산성, 25
        if (x >= 66 && x <= 120) return "2"; // 중성, 56
        if (x >= 121 && x <= 165) return "3"; // 알칼리성, 118
        if (x >= 166) return "4"; // 강알칼리성, 204
        break;

      case 'DT09': //비중
        if (x >= 145) return "0"; //207
        if (x >= 135 && x <= 144) return "1"; //164
        if (x >= 93 && x <= 134) return "2"; //93
        if (x >= 71 && x <= 92) return "3"; //77
        if (x >= 61 && x <= 70) return "4"; //39
        if (x <= 60) return "4"; //37
        break;

      case 'DT10': //백혈구
        if (x >= 43) return "0"; //44
        if (x >= 40 && x <= 39) return "1"; //41
        if (x >= 35 && x < 38) return "2"; //38
        if (x <= 34) return "3"; //32
        break;

      case 'DT11': //비타민
        if (x >= 140) return "0"; //146
        if (x >= 95 && x <= 139) return "1"; //101
        if (x >= 58 && x <= 94) return "2"; //18
        if (x <= 57) return "3"; //4
        break;

      default:
        return "0";
    }

    return "0";
  }

}