

import 'package:yocheck_pet/layers/entity/urine_save_dto.dart';
import 'package:yocheck_pet/layers/model/vo_history.dart';

import '../../entity/history_dto.dart';
import '../../entity/urine_chart_dto.dart';
import '../../entity/urine_result_dto.dart';
import '../../entity/user_name_dto.dart';

abstract class UrineRepository {
  Future<HistoryDTO?> getHistory(History history);
  Future<UrineResultDTO?> getUrineResult(String dateTime);
  Future<UrineChartDTO?> fetchUrineChart(Map<String, dynamic> searchDateMap);
  Future<String?> getAiAnalysis(Map<String, dynamic> searchDateMap);
  Future<UrineSaveDTO?> saveUrine(List<Map<String, dynamic>> toMap);
  Future<UserNameDTO?> getUserName();
  Future<String?> getAppVersion();
  Future<String> deleteHistory(String dateTime);
}