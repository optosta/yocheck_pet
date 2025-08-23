
import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../layers/model/enum/ai_analysis_results.dart';

/// 분기 계산 클래스
class Branch {

  /// AI 분석 결과에 맞는 텍스트 내용으로 변환
  static AiAnalysisResults aiAnalysisToContent(String resultText) {
    String result = resultText.split(',')[0];

    ///TODO : 추후에 다국어 지원을 위해 수정 필요
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
    } else if(result == '간염'){
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

  /// 결과 텍스트
  /// 현재 사용중
  static resultStatusToText(String status, int index){
    if(index == 8){ // 비중
      switch(status){
        case '0' : return '1.000';
        case '1' : return '1.010';
        case '2' : return '1.020';
        case '3' : return '1.030';
        case '4' : return '1.040';
        case '5' : return '1.050';
        case '6' : return '1.060';
        case '7' : return '1.070';
        default  : return '1.000';
      }
    }

    else if(index == 10){ // 비타민
      switch(status){
        case '0' : return '0mg/dL';
        case '1' : return '10mg/dL';
        case '2' : return '20mg/dL';
        case '3' : return '40mg/dL';
        default  : return '-mg/dL';
      }
    }

    else if(index == 7){ // PH
      switch(status){
        case '0' : return '5';//'acidic'.tr();
        case '1' : return '6';//'mild_acidic'.tr();
        case '2' : return '6.5';'neutrality'.tr();
        case '3' : return '7';'alkaline'.tr();
        case '4' : return '8';'strong_alkaline'.tr();
        case '5' : return '9';'strong_alkaline'.tr();
      }
    }

    else if(index == 0 || index == 1 || index == 9){ // 잠혈, 빌리루빈, 백혈구
      switch(status){
        case '0' : return 'negative'.tr();
        case '1' : return 'caution'.tr();
        case '2' : return 'danger'.tr();
        case '3' : return 'serious'.tr();
        default  : return '-';
      }
    }

    else if(index == 2){ // 우로빌리노겐
      switch(status){
        case '0' : return 'negative'.tr();
        case '1' : return 'caution'.tr();
        case '2' : return 'danger'.tr();
        case '3' : return 'serious'.tr();
        case '4' : return 'serious'.tr();
        default  : return '-';
      }
    }

    else if(index == 3) { // 케톤체
      switch(status){
        case '0' : return 'negative'.tr();
        case '1' : return 'caution'.tr();
        case '2' : return 'danger'.tr();
        case '3' : return 'serious'.tr();
        default  : return 'negative'.tr();
      }
    }

    else if(index == 4) { // 단백질
      switch(status){
        case '0' : return 'negative'.tr();
        case '1' : return 'caution'.tr();
        case '2' : return 'danger'.tr();
        case '3' : return 'serious'.tr();
        case '4' : return 'serious'.tr();
        default  : return '-';
      }
    }

    else if(index == 6) { //포도당
      switch(status){
        case '0' : return 'negative'.tr();
        case '1' : return 'caution'.tr();
        case '2' : return 'danger'.tr();
        case '3' : return 'serious'.tr();
        case '4' : return 'serious'.tr();
        default  : return '-';
      }
    }

    else if(index == 5) { // 아질산염
      switch(status){
        case '0' : return 'negative'.tr();
        case '1' : return 'positive'.tr();
        default  : return 'negative'.tr();
      }
    }

  }

  /// 박스형 결과 이미지
  static String resultStatusToImagePath(String status, int index){
    if(index == 10 || index == 5){
      return 'assets/images/urine/result/rating_icon_9.png';
    } else {
      switch(status){
        case '0' : return  'assets/images/urine/result/rating_icon_0.png';
        case '1' : return  'assets/images/urine/result/rating_icon_1.png';
        case '2' : return  'assets/images/urine/result/rating_icon_2.png';
        case '3' : return  'assets/images/urine/result/rating_icon_3.png';
        case '4' : return  'assets/images/urine/result/rating_icon_3.png';
        case '5' : return  'assets/images/urine/result/rating_icon_3.png';
        default  : return  'assets/images/urine/result/rating_icon_0.png';
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
    if (index == 10|| index == 8|| index == 7) { // ph, 비중, 비타민 예외
      return AppColors.resultExceptColor;
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

    // else if(index == 7) { // 산성도, 비중
    //   switch(status){
    //     case '0' : return AppColors.resultColor1;
    //     case '1' : return AppColors.resultColor2;
    //     case '2' : return AppColors.resultColor2;
    //     case '3' : return AppColors.resultColor2;
    //     case '4' : return AppColors.resultColor2;
    //     default  : return AppColors.resultColor1;
    //   }
    // }

    else { // 아질산염
      switch(status){
        case '0' : return AppColors.resultExceptColor;
        case '1' : return const Color(0xFF5A779A);
        default  : return AppColors.resultColor1;
      }
    }
  }

  static resultStatusToBgColor(String status, int index) {
    if ( index == 10 || index == 7 || index == 8) { // ph, 비중, 비타민 예외
      return AppColors.resultBGExceptColor;
    }

    else if(index == 0 || index == 1 || index == 9 ){ // 잠혈, 빌리루빈, 백혈구
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
    // else if(index == 7 || index == 8) { // 산성도, 비중
    //   switch(status){
    //     case '0' : return AppColors.resultBGColor1;
    //     case '1' : return AppColors.resultBGColor2;
    //     case '2' : return AppColors.resultBGColor2;
    //     case '3' : return AppColors.resultBGColor2;
    //     case '4' : return AppColors.resultBGColor2;
    //     default  : return AppColors.resultColor1;
    //   }
    // }

    else { // 아질산염
      switch(status){
        case '0' : return AppColors.resultBGExceptColor;
        case '1' : return const Color(0xFFC1CEDC);
        default  : return AppColors.resultBGColor1;
      }
    }
  }

  static urineLabelToUrineDataType(String urineName) {
    if (urineName == 'blood'.tr()) {
      return 'DT01';
    } else if (urineName == 'bilirubin'.tr()) {
      return 'DT02';
    } else if (urineName == 'urobilnogen'.tr()) {
      return 'DT03';
    } else if (urineName == 'ketones'.tr()) {
      return 'DT04';
    } else if (urineName == 'protein'.tr()) {
      return 'DT05';
    } else if (urineName == 'nitrate'.tr()) {
      return 'DT06';
    } else if (urineName == 'glucosuria'.tr()) {
      return 'DT07';
    } else if (urineName == 'ph'.tr()) {
      return 'DT08';
    } else if (urineName == 'gravity'.tr()) {
      return 'DT09';
    } else if (urineName == 'leukocytes'.tr()) {
      return 'DT10';
    } else if (urineName == 'vitamins'.tr()) {
      return 'DT11';
    } else {
      return 'DT00';
    }
  }


  /// 소변 검사 결과 등급 함수
  /// 25.01.07 최신화
  /// 25.01.24 h값으로 롤백(빌리루빈, 우로빌리노겐, 백혈구)
  /// 25.08.22 새로운 컷오프 적용
  static String urineGradeResult(String type, double x) {
    switch (type) {
      case 'DT01': // 잠혈
        if (x <= 65) return "0"; // 음성
        if (x > 65 && x <= 100) return "1"; // 주의
        if (x > 100 && x <= 116) return "2"; // 위험
        if (x > 116) return "3"; // 심각
        break;

      case 'DT02': // 빌리루빈
        if (x >= 40.5) return "0"; // 음성
        if (x >= 38.5 && x < 40.5) return "1"; // 주의
        if (x >= 36.9 && x < 38.5) return "2"; // 위험
        if (x < 36.9) return "3"; // 심각
        break;

      case 'DT03': // 우로빌리노겐
        if (x >= 33) return "0"; // 음성
        if (x >= 26.5 && x < 33) return "0"; // 음성
        if (x >= 22 && x < 26.6) return "1"; // 주의
        if (x >= 17 && x < 22) return "2"; // 위험
        if (x < 17) return "3"; // 심각
        break;

      case 'DT04': //케톤체
        if (x >= 36) return "0"; // 음성
        if (x >= 28 && x < 36) return "1"; // 주의
        if (x >= 23.5 && x < 28) return "2"; // 위험
        if (x < 23.5) return "3"; // 심각

        break;

      case 'DT05': //단백질
        if (x <= 73) return "0"; // 음성
        if (x > 73 && x <= 89) return "0"; // 음성
        if (x > 89  && x <= 105.8) return "1"; // 주의
        if (x > 105.8 && x <= 117.9) return "2"; // 위험
        if (x > 117.9) return "3"; // 심각
        break;

      case 'DT06': //아질산염
        return x >= 42 ? "0" : "1"; // 음성/양성

      case 'DT07': //포도당
        if (x >= 76.6) return "0"; //음성
        if (x >= 60 && x < 76.6) return "1"; // 주의
        if (x >= 36 && x < 60) return "2"; // 위험
        if (x < 36) return "3"; // 심각
        break;

      case 'DT08': //산성도
        if (x < 26.4) return "0"; // 산성 - 5
        if (x >= 26.4 && x < 47.7) return "1"; // 약산성 - 6
        if (x >= 47.7 && x < 82.8) return "2"; // 중성 - 6.5
        if (x >= 82.8 && x < 128.7) return "3"; // 알칼리성 -7
        if (x >= 128.7 && x < 167.3) return "4"; // 강알칼리성 - 8
        if (x >= 167.3) return "5"; // 강강?알칼리성 - 9
        break;

      case 'DT09': //비중
        if (x > 175) return "0"; // 1.000
        if (x > 99.2 && x <= 175) return "1"; // 1.010
        if (x > 68.6 && x <= 99.2) return "2"; // 1.020
        if (x > 50 && x <= 68.6) return "3"; // 1.030
        if (x > 41 && x <= 50) return "4"; // 1.040
        if (x > 35 && x <= 41) return "5"; // 1.050
        if (x > 30.5 && x <= 35) return "6";// 1.060
        if (x <= 30.5) return "7"; // 1.070
        break;

      case 'DT10': //백혈구
        if (x >= 39.6) return "0"; // 음성
        if (x >= 38 && x < 39.6) return "1"; // 주의
        if (x >= 34.2 && x < 38) return "2"; // 위험
        if (x < 34.2) return "3"; // 심각
        break;

      case 'DT11': //비타민
        if (x >= 118) return "0";
        if (x >= 80 && x < 118) return "1";
        if (x >= 61.5 && x < 80) return "2";
        if ( x < 61.5) return "3";
        break;

      default:
        return "0";
    }

    return "0";
  }

}