import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class InteractiveImage extends GetView<ImageZoomController> {
  final String imageUrl;
  ImageZoomController controller;

  InteractiveImage({
    required this.imageUrl,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleUpdate: (details) => controller.scale.value *= details.scale,
      child: Transform.scale(
        filterQuality: FilterQuality.high,
        scale: controller.scale.value.clamp(1.0, 8.0),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      ),
    );
  }
}

class ImageZoomController extends GetxController {
  final RxDouble scale = RxDouble(2.0);
}
