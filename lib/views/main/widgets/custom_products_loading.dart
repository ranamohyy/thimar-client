import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomProductsLoading extends StatelessWidget {
  const CustomProductsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return
       Shimmer.fromColors(

      baseColor: Colors.grey.shade200,
      highlightColor: Colors.white,
    child:  GridView.builder(
      padding: EdgeInsets.zero,
      itemCount:10 ,
      shrinkWrap: true,
      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2
          , childAspectRatio: 200.w / 300.h),
      physics: const NeverScrollableScrollPhysics(),

      itemBuilder: (context, index) =>
    Column(
      mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Container(
    height: 80.h,
    width: 150.w,
    decoration:BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.circular(12.r)

    ),


    ),
     SizedBox(height: 4.h,),
    Container(
    height: 24.h,
    width: 60.w,
    decoration:BoxDecoration(
    color: Colors.grey.shade200,
    borderRadius: BorderRadius.circular(8)

    ),


    ),
       SizedBox(height: 4.h,),

      Container(
    height: 24.h,
    width: 60.w,
    decoration:BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8.r)

    ),


      ),
      SizedBox(height: 4.h,),
      Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 25.h,
          width: 40.w,
          decoration:BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadiusDirectional.circular(8.r)

          ),


        ),
         SizedBox(width: 8.w,),
        Container(
          height: 25.h,
          width: 40.w,
          decoration:BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadiusDirectional.circular(8.r)

          ),


        ),
         SizedBox(width: 8.w,),
        Container(
          height: 25.h,
          width: 40.w,
          decoration:BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadiusDirectional.circular(8.r)

          ),


        ),
      ],
    ),


    ],


    )







    )
    );
  }
}
