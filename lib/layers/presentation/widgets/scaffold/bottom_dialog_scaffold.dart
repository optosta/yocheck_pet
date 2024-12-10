import 'package:flutter/material.dart';
import 'package:yocheck_pet/common/common.dart';
import 'package:yocheck_pet/layers/presentation/widgets/scaffold/transparent_scaffold.dart';


class BottomDialogScaffold extends StatelessWidget {
  final Widget body;
  const BottomDialogScaffold({required this.body, super.key});

  @override
  Widget build(BuildContext context) {
    return TransparentScaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: const EdgeInsets.only(top: 20, bottom: 20, right: 15, left: 15),
          decoration: BoxDecoration(
              color: context.backgroundColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              body,
            ],
          ),
        ),
      ),
    );
  }
}