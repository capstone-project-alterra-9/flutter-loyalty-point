import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeltonWidget extends StatelessWidget {
  const SkeltonWidget({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = 0,
    this.margin,
  });

  final double width;
  final double height;
  final EdgeInsetsGeometry? margin;
  final double borderRadius;

  static const baseColor = Color(0xffe5e7eb);
  static const highlightColor = Color(0xfff3f4f6);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
