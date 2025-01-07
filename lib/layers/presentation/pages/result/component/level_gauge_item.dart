import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/enums/urine_item_type.dart';

/// 아질산염 (2)
/// 잠혈, 빌리루빈, 케톤체[무채색], 포도당, 비중[무채색], 백혈구, 비타민[무채색] (4)
/// 단백질, 산성도[무채색] (5)
class LevelGaugeItem extends StatelessWidget {

  /// 결과 타입
  final UrineItemType type;

  ///결과값
  final String status;

  const LevelGaugeItem({
    super.key,
    required this.type,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: _buildLevel(type, status)
      ),
    );
  }
  _buildLevel(UrineItemType type, String status) {
    return List.generate(
      2,
      //type.levelCount,
      (index) => Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
            color: AppColors.level2Colors[0][index]
        )

            //
            // type.levelCount == 5
            //     ? AppColors.level5Colors[int.parse(status)][index]
            //     : type.levelCount == 4
            //         ? AppColors.level4Colors[int.parse(status)][index]
            //         : AppColors.level2Colors[int.parse(status)][index]),
      ),
    );
  }
}
