import 'package:flutter/material.dart';

import '../../../../../../common/common.dart';
import '../../../../widgets/style_text.dart';

class WarningMessage extends StatefulWidget {
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;

  const WarningMessage({
    Key? key,
    this.backgroundColor = Colors.yellow,
    this.textColor = Colors.black,
    this.icon = Icons.warning,
  }) : super(key: key);

  @override
  State<WarningMessage> createState() => _WarningMessageState();
}

class _WarningMessageState extends State<WarningMessage>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true); // 반복하며 깜박이도록 설정
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.orange.shade100, width: 2.0),
      ),
      child: Row(
        children: [
          Icon(widget.icon, color: widget.textColor),
          const SizedBox(width: 10),
          Expanded(
            child: RichText(
              textScaleFactor: 1.3,
              softWrap: true,
              maxLines: 4,
              text: TextSpan(
                text: 'warning_message_head'.tr(),
                style: const TextStyle(color: AppColors.red),
                children: <InlineSpan>[
                  WidgetSpan(
                    child: FadeTransition(
                      opacity: _controller,
                      child: StyleText(
                        text: 'warning_message_seconds'.tr(),
                        fontWeight: AppDim.weightBold,
                        size: AppDim.fontSizeLarge,
                        color: AppColors.red,
                      )
                    ),
                  ),
                  TextSpan(
                    text: 'warning_message_end'.tr(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
