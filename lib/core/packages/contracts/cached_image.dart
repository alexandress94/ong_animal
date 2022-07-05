import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';

abstract class CachedImage {
  CachedNetworkImage cached({
    required String imageUrl,
    Widget Function(BuildContext context, String url)? placeholder,
    Widget Function(BuildContext context, String url, dynamic error)?
        errorWidget,
    BoxFit? fit,
    double? width,
    double? height,
  });
}
