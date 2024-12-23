import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';

import '../../../../entity/history_dto.dart';
import '../../../widgets/w_data_empty.dart';
import '../../../widgets/w_dotted_line.dart';
import 'history_list_item.dart';

class AllListFragment extends StatelessWidget {
  final ScrollController allScrollController;
  final List<HistoryDataDTO> historyList;

  const AllListFragment({
    super.key,
    required this.allScrollController,
    required this.historyList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        child: historyList.isEmpty
            ? DataEmpty(message: 'history_empty'.tr())
            : ListView.builder(
                controller: allScrollController,
                physics: const BouncingScrollPhysics(),
                itemCount: historyList.length,
                itemBuilder: (BuildContext context, int index) {
                  return HistoryListItem(history: historyList[index]);
                },
              ),
    );
  }
}
