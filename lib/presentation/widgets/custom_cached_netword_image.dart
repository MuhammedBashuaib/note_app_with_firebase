import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:note_app_with_firebase/res/sizes.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: heightScreen * .2,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            widthScreen * .02,
          ),
          image: DecorationImage(
            image: imageProvider,
            // fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
        height: heightScreen * .2,
        width: double.infinity,
        child: const Center(child: CircularProgressIndicator()),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
