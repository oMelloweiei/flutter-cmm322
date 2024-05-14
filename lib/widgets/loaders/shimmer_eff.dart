import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:binny_application/widgets/class/Color.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect(
      {Key? key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color})
      : super(key: key);

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[500]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color ?? Ticolor.whiteMain1,
            borderRadius: BorderRadius.circular(radius)),
      ),
    );
  }
}
