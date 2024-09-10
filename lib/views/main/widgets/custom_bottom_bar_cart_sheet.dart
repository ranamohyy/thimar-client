
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constans.dart';
import '../../../core/design/app_image.dart';
class CustomBottomBarCart extends StatelessWidget {
  const CustomBottomBarCart({super.key, required this.cartTotal,});
final String cartTotal;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      Stack(
      alignment: Alignment.center,
      children: [
        AppImage(
            url: "Rectangle_market.png", height: 40.h, width: 40.w),
        AppImage(
          url: "basket.png",
          height: 25.h,
          width: 25.w,
          fit: BoxFit.fill,
          color: Colors.white,
        ),
      ],
    ),
    SizedBox(
    width: 6.w,
    ),
    Text(
    "إضافة إلي السلة",
    style: TextStyle(
    color: Colors.white,
    fontSize: 16.sp,
    fontWeight: FontWeight.w800),
    ),
    SizedBox(
    width: 150.w,
    ),
    Text(
       cartTotal.toString(),
    style:kTextStyle14),
    ]
    );
  }
}
