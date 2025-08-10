
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EasyNetworkImage extends StatelessWidget {
  final String url;
  final BorderRadiusGeometry? borderRadius;
  final int cacheSize;

  const EasyNetworkImage(this.url, {super.key, this.borderRadius, required this.cacheSize});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: Image.network(
        cacheHeight: cacheSize,
        cacheWidth: cacheSize,
        url,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            period: const Duration(milliseconds: 900),
            child: Container(color: Colors.grey.shade300),
          );
        },
        errorBuilder:
            (context, error, stackTrace) => Center(child: Icon(Icons.error)),
      ),
    );
  }
}