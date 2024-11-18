import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomerImage extends StatelessWidget {
  const CustomerImage({super.key, required this.imageUrl});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .35,
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child:  CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: imageUrl,
          placeholder: (context, url) => const Center(child: CircularProgressIndicator(),),
          errorWidget: (context, url, error) => Container(
              color: Colors.white,
              child: const Icon(
                Icons.error,
                color: Colors.red,
                size: 40,
              )),
        ),
      ),
    );
  }
}