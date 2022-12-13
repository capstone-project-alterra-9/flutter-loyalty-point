import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeltonWidget extends StatelessWidget {
  const SkeltonWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 0,
  });

  final double width;
  final double height;
  final double borderRadius;

  static const baseColor = Color(0xfff1f5f9);
  static const highlightColor = Color(0xfff8fafc);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
