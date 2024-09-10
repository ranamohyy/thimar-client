import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/app_image.dart';
class ItemCatogryBuilder extends StatelessWidget {
  const ItemCatogryBuilder({super.key, required this.imageUrl, required this.text});
 final  String imageUrl;
 final String text;

  @override
  Widget build(BuildContext context) {
    return    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppImage(
          url:imageUrl,
          height: 100.h,
          width: 150.w,
          fit: BoxFit.fill,
        ),
         SizedBox(height: 10.h,),
        Text(text)
      ],
    );
  }
}
