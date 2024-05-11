import 'package:binny_application/widgets/loaders/shimmer_eff.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CircularImage extends StatelessWidget {
  const CircularImage(
      {super.key,
      this.width = 50,
      this.height = 50,
      this.overlayColor,
      this.backgroundColor,
      required this.image,
      this.fit = BoxFit.cover,
      this.padding = 5,
      this.isNetWorkImage = false});

  final BoxFit? fit;
  final String image;
  final bool isNetWorkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          // color: backgroundColor
          borderRadius: BorderRadius.circular(100)),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
              child: isNetWorkImage
                  ? CachedNetworkImage(
                      fit: fit,
                      color: overlayColor,
                      imageUrl: image,
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) =>
                              const ShimmerEffect(width: 55, height: 55),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error))
                  : Image(
                      fit: fit,
                      image: isNetWorkImage
                          ? NetworkImage(image)
                          : AssetImage(image) as ImageProvider))),
    );
  }
}
