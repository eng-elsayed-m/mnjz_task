import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String path;
  final BoxFit? fit;
  const CachedImage({super.key, required this.path, this.fit = BoxFit.fill});

  @override
  Widget build(BuildContext context) {
    return Image.network(path, fit: fit);
    // CachedNetworkImage(
    //   imageUrl: "http://via.placeholder.com/350x150",
    //   progressIndicatorBuilder: (context, url, downloadProgress) =>
    //       CircularProgressIndicator(value: downloadProgress.progress),
    //   fit: fit,
    //   errorWidget: (context, url, error) => const Icon(Icons.error),
    // );
  }
}
