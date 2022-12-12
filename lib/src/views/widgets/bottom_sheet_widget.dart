import 'package:flutter/material.dart';
import 'package:flutter_loyalty_point/src/styles/styles.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final double safeAreaBottom =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .padding
            .bottom;

    return Container(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
        bottom: safeAreaBottom + 8,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Styles.colorBlack50)),
      ),
      child: child,
    );
  }
}
