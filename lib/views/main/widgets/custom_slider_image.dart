import 'package:flutter/material.dart';
import 'package:thimar/core/design/app_image.dart';

class CustomSliderImage extends StatelessWidget {
  const CustomSliderImage({super.key, required this.imageUrl});
final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return AppImage(
        url:imageUrl,
            fit: BoxFit.fill,


    );
  }
}
