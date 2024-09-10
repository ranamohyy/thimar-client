import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class CustomCategriesLoading extends StatelessWidget {
  const CustomCategriesLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.white,
      child:
      SizedBox(
      height: 170.h,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
          physics: const BouncingScrollPhysics()
          ,
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => const
          Padding(padding: EdgeInsets.symmetric(horizontal: 32)),
          itemBuilder:  (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  height: 100,
                  width: 150,
                ),
              const  SizedBox(height: 12,),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  height: 20,
                  width: 60,
                )

              ],

            );
          }
      ),


    )


    );
  }
}
