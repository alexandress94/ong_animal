import 'package:ong_animals/core/packages/contracts/cached_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImageImpl implements CachedImage {
  @override
  CachedNetworkImage cached({
    required String imageUrl,
    BoxFit? fit,
    double? width,
    double? height,
    Widget Function(BuildContext context, String url)? placeholder,
    Widget Function(BuildContext context, String url, dynamic error)?
        errorWidget,
  }) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: placeholder,
      errorWidget: errorWidget,
      fit: fit,
      width: width,
      height: height,
    );
  }
}
