
import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../layers/model/enum/ai_analysis_results.dart';
import '../../layers/model/enum/blood_data_type.dart';

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
        case '0' : return '-';
        case '1' : return '+';
        case '2' : return '++';
        case '3' : return '+++';
        default  : return '-';
      }
    }

    else if(index == 7){ // PH
      switch(status){
        case '0' : return 'acidic'.tr();
        case '1' : return 'acidic'.tr();
        case '2' : return 'neutrality'.tr();
        case '3' : return 'alkaline'.tr();
        case '4' : return 'strong_alkaline'.tr();
        default  : return '-';
      }
    }

    else if(index == 0 || index == 1 || index == 9){ // 잠혈, 빌리루빈, 백혈구
      switch(status){
        case '0' : return 'safety'.tr();
        case '1' : return 'attention'.tr();
        case '2' : return 'caution'.tr();
        case '3' : return 'danger'.tr();
        default  : return '-';
      }
    }

    else if(index == 2){ // 우로빌리노겐
      switch(status){
        case '0' : return 'safety'.tr();
        case '1' : return 'attention'.tr();
        case '2' : return 'caution'.tr();
        case '3' : return 'danger'.tr();
        case '4' : return 'serious'.tr();
        default  : return '-';
      }
    }

    else if(index == 3) { // 케톤체
      switch(status){
        case '0' : return 'safety'.tr();
        case '1' : return 'attention'.tr();
        case '2' : return 'caution'.tr();
        case '3' : return 'danger'.tr();
        default  : return 'safety'.tr();
      }
    }

    else if(index == 4 ) { // 단백질, 포도당
      switch(status){
        case '0' : return 'safety'.tr();
        case '1' : return 'attention'.tr();
        case '2' : return 'caution'.tr();
        case '3' : return 'danger'.tr();
        case '4' : return 'serious'.tr();
        default  : return 'safety'.tr();
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
        case '0' : return 'safety'.tr();
        case '1' : return 'attention'.tr();
        default  : return 'safety'.tr();
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
        case '5' : return '${Texts.imagePath}/urine/result/plus_4.png';
        case '6' : return '${Texts.imagePath}/urine/result/plus_4.png';
        case '7' : return '${Texts.imagePath}/urine/result/plus_4.png';
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
  static String urineGradeResult(String type, double x) {
    switch (type) {
      case 'DT01': // 잠혈
        if (x < 70 ) return "0"; //54
        if (x >= 70 && x <= 95) return "1"; //79
        if (x >= 95 && x <= 120) return "2"; //110
        if (x >= 120) return "3"; //140
        break;

      case 'DT02': // 빌리루빈
        if (x > 44) return "0"; //42
        if (x > 42 && x <= 44) return "1"; //40
        if (x > 38  && x <= 42) return "2"; //33
        if (x <= 38) return "3"; //25
        break;

      case 'DT03': // 우로빌리노겐
        if (x >= 37) return "0";
        if (x > 26 && x <= 37) return "1";
        if (x > 20 && x <= 26) return "2";
        if (x > 16 && x <= 20) return "3";
        if (x <= 16) return "4";
        break;

      case 'DT04': //케톤체
        if (x > 38) return "0";//43
        if (x > 28 && x <= 38) return "1"; //35
        if (x > 20.7 && x <= 28) return "2"; //35
        if (x <= 20.7) return "3"; //23
        break;

      case 'DT05': //단백질
        if (x < 63) return "0"; //53
        if (x >= 63 && x < 80) return "1"; // 62
        if (x >= 80  && x < 100) return "2"; //75
        if (x >= 100 && x < 120) return "3"; //125
        if (x >= 120) return "4"; //149
        break;

      case 'DT06': //아질산염
        return x >= 43 ? "0" : "1"; //44,31

      case 'DT07': //포도당
        if (x > 100) return "0"; //205
        if (x > 75 && x <= 100) return "1"; //130
        if (x > 60 && x <= 75) return "2"; //105
        if (x > 30 && x <= 60) return "3"; //52
        if (x <= 30) return "4"; //10
        break;

      case 'DT08': //산성도
        if (x < 65) return "1"; // 산성, 25
        if (x >= 65 && x < 140) return "2"; // 중성, 56
        if (x >= 140 && x < 165) return "3"; // 알칼리성, 118
        if (x >= 165) return "4"; // 강알칼리성, 204
        break;

      case 'DT09': //비중
        if (x > 180) return "0"; //207
        if (x > 100 && x <= 180) return "1"; //164
        if (x > 70 && x <= 100) return "2"; //93
        if (x > 50 && x <= 70) return "3"; //77
        if (x > 38 && x <= 50) return "4"; //39
        if (x > 30 && x <= 38) return "5"; //39
        if (x > 28 && x <= 30) return "6"; //39
        if (x <= 28) return "7"; //37
        break;

      case 'DT10': //백혈구
        if (x > 42) return "0"; // 44
        if (x > 38 && x <= 42) return "1"; // 41
        if (x <= 38) return "3"; // 32
        break;

      case 'DT11': //비타민
        if (x > 110) return "0"; //146
        if (x > 70 && x <= 110) return "1"; //101
        if (x > 59 && x <= 70) return "2"; //18
        if (x <= 59) return "3"; //4
        break;

      default:
        return "0";
    }

    return "0";
  }

}