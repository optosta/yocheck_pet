
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:ripple_wave/ripple_wave.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/pages/analysis/bluetooth/bluetooth_viewmodel.dart';
import 'package:yocheck_pet/layers/presentation/pages/analysis/bluetooth/component/loaded_fragment.dart';

import '../../../../model/enum/bluetooth_status.dart';
import '../../../widgets/default_button.dart';
import '../../../widgets/scaffold/frame_scaffold.dart';
import '../../../widgets/style_text.dart';
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

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BluetoothViewModel2(),
      child: FrameScaffold(
        appBarTitle: 'insp_title'.tr(),
        body: Consumer<BluetoothViewModel2>(
          builder: (context, provider, child) {
            return  _stateBranchFrame(provider.status);
          },
        ),
      ),
    );
  }

  _stateBranchFrame(BluetoothStatus status){
    switch(status){
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
        ErrorFragment(status: status);
    }
  }
}
