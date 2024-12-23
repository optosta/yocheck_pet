import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/pages/history/component/history_list_item.dart';

import '../../../../entity/history_dto.dart';
import '../../../widgets/w_data_empty.dart';
import '../../../widgets/w_dotted_line.dart';



class RecentListFragment extends StatelessWidget {
  final List<HistoryDataDTO> historyList;

  const RecentListFragment({
    super.key,
    required this.historyList,
  });

  int get recentListMaxCount => 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: historyList.isEmpty
          ? DataEmpty(message: 'history_empty'.tr())
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: historyList.length > recentListMaxCount
                  ? recentListMaxCount
                  : historyList.length,
              itemBuilder: (BuildContext context, int index) =>
                  HistoryListItem(history: historyList[index],
              ),

            ),
    );
  }
}
