import 'package:flutter/material.dart';

class CustomImageWidget extends StatelessWidget {
  final ImageProvider image;
  final Alignment alignment;
  const CustomImageWidget({
    required this.image,
    this.alignment = Alignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(22),
      child: Image(
        image: image,
        fit: BoxFit.cover,
        alignment: alignment,
        loadingBuilder: (_, child, progress) => progress == null
            ? child
            : const ColoredBox(
                color: Color(0xFF1A211C),
                child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
              ),
        errorBuilder: (_, __, ___) => const ColoredBox(
          color: Color(0xFF1A211C),
          child: Center(
            child: Icon(Icons.broken_image_outlined, color: Colors.white24),
          ),
        ),
      ),
    );
  }
}
