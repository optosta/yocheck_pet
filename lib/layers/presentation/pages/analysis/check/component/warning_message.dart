import 'package:flutter/material.dart';

import '../../../../widgets/style_text.dart';

class WarningMessage extends StatelessWidget {
  final String message;
  final Color backgroundColor;
  final Color textColor;
  final IconData icon;

  const WarningMessage({
    Key? key,
    required this.message,
    this.backgroundColor = Colors.yellow,
    this.textColor = Colors.black,
    this.icon = Icons.warning,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.orange.shade100, width: 2.0),
      ),
      child: Row(
        children: [
          Icon(icon, color: textColor),
          const SizedBox(width: 10),
          Expanded(
            child: StyleText(
              text: message,
              softWrap: true,
              maxLinesCount: 4,
            ),
          ),
        ],
      ),
    );
  }
}
