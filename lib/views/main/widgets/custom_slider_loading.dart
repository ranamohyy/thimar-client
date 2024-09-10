import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomSliderLoading extends StatelessWidget {
  const CustomSliderLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.white,
            child:
            SizedBox(
              height: 164.h,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: CarouselSlider(
                options: CarouselOptions(
                    scrollDirection: Axis.horizontal,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 164.w / 375.h),
                items:[
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12.r)
                    ),
                  )

                ]

                      ),
                    )


        );
  }
}
