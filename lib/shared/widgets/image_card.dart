import 'package:flutter/material.dart';

class ImageCard extends StatelessWidget {
  final String imageUrl;

  const ImageCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: FadeInImage.assetNetwork(
        placeholder: 'assets/loaders/bottle-loader.gif',
        image: imageUrl,
        fit: BoxFit.cover,
        height: 250,
      ),
    );
  }
}
