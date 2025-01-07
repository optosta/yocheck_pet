import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/pages/analysis/bluetooth/component/loaded_fragment.dart';

import '../../../../../common/utils/my_logger.dart';
import '../../../../model/enum/bluetooth_status.dart';
import '../../../routes/route_path.dart';
import '../../../widgets/scaffold/frame_scaffold.dart';
import 'bluetooth_viewmodel2.dart';
import 'component/error_fragment.dart';

/// 블루투스 연결 화면
/// TODO: 1.디자인 2.측정데이터 서버에 저장
class BluetoothView extends StatefulWidget {
  const BluetoothView({super.key});

  @override
  State<BluetoothView> createState() => _BluetoothViewState();
}

class _BluetoothViewState extends State<BluetoothView> {
  late BluetoothViewModel2 _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = BluetoothViewModel2((urineList, testDate) => {
        logger.i('결과 화면 호출'),
        if (mounted){
            context.replace(RoutePath.result, extra: {
              'urineStatus': urineList,
              'testDate': testDate,
            }),
          }
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _viewModel.allClean();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BluetoothViewModel2>.value(
      value: _viewModel,
      builder: (context, child){
        return FrameScaffold(
          appBarTitle: 'insp_title'.tr(),
          body: Consumer<BluetoothViewModel2>(
            builder: (context, provider, child) {
              return _stateBranchFrame(provider.status);
            },
          ),
        );
      },
    );
  }

  _stateBranchFrame(BluetoothStatus status) {
    switch (status) {
      case BluetoothStatus.scan:
      case BluetoothStatus.connect:
      case BluetoothStatus.inspection:
        return LoadedFragment(status: status);
      case BluetoothStatus.scanError:
      case BluetoothStatus.connectError:
      case BluetoothStatus.inspectionError:
      case BluetoothStatus.unableError:
      case BluetoothStatus.stripError:
      case BluetoothStatus.cutoff:
        return ErrorFragment(status: status);
    }
  }
}
