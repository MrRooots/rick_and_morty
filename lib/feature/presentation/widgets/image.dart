import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  final String url;
  final bool rounded;
  final double size;

  const ImageWidget({
    Key? key,
    required final this.url,
    final this.rounded = false,
    final this.size = 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      height: size,
      width: size,
      fadeInDuration: const Duration(milliseconds: 250),
      placeholder: (_, __) => Image.asset('assets/images/placeholder.png'),
      errorWidget: (_, __, ___) => Image.asset('assets/images/failed.png'),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(10.0),
            bottomLeft: const Radius.circular(10.0),
            bottomRight: Radius.circular(rounded ? 10.0 : 0.0),
            topRight: Radius.circular(rounded ? 10.0 : 0.0),
          ),
          image: DecorationImage(image: imageProvider),
        ),
      ),
    );
  }
}
