
import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';
import '../../../../../common/utils/local_json.dart';
import '../../../../model/vo_package.dart';
import '../../../widgets/scaffold/frame_scaffold.dart';
import '../../../widgets/w_dotted_line.dart';
import 'w_opensource_item.dart';

/// 아래의 명령어를 통해서, 주기적으로 라이센스 json을 최신화 해주세요.
/// flutter pub run flutter_oss_licenses:generate.dart -o assets/json/licenses.json --json
class OpensourceView extends StatefulWidget {
  const OpensourceView({super.key});

  @override
  State<OpensourceView> createState() => _OpensourceViewState();
}

class _OpensourceViewState extends State<OpensourceView> {
  List<Package> packageList = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  void initData() async {
    final list = await LocalJson.getObjectList<Package>("json/licenses.json");
    setState(() {
      packageList = list;
    });
  }

  String get title => '오픈소스 라이선스';

  @override
  Widget build(BuildContext context) {
    return FrameScaffold(
      appBarTitle: 'opensource_license'.tr(),
      body: ListView.separated(
        itemBuilder: (context, index) => OpensourceItem(packageList[index]),
        itemCount: packageList.length,
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDim.medium),
            child: DottedLine(mWidth: double.infinity,),
          );
        },
      ),
    );
  }
}
