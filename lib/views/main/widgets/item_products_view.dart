import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/constans.dart';
import '../../../core/design/app_image.dart';
class ProductsItemBuilder extends StatelessWidget {
  const  ProductsItemBuilder({super.key, required this.imageUrl,required this.onPressed,
     required this.title, required this.beforeDisc, required this.price, required this.percentDisc});
final String imageUrl;
final String title;
final num beforeDisc;
final num price;
final num percentDisc;
   final void Function()  onPressed;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment:CrossAxisAlignment.start ,
      children: [
         SizedBox(
           height: 100.h,width: 170.w,
           child: Stack(
             alignment: Alignment.topLeft,
             children: [
               AppImage(url:imageUrl,height: 100.h,width: 170.w,fit: BoxFit.fill, ),

               Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(12.r)),
                  color:const  Color(0xff61B80C)
                ),
                height: 20.h,
                width: 50.w,
                child: Text(
                  textAlign: TextAlign.center,
                  "${(percentDisc *100).toInt()} %"
                ,  style:  TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 12.sp,
                  fontFamily: kTextFamily,


                ),
                  ),
              ),

                 ],),),
        Padding(padding:const EdgeInsets.symmetric(horizontal: 3.0),
          child: Column(      mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.start ,

            children: [
                 Text(title,
            style:
                   kTextStyle18,),
               const    SizedBox(height: 4,),
             const Text("السعر / 1 كجم",
            style:kTextStyle15light),
             const SizedBox(height: 6,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
                 Text("${price.toString()}ر.س",
                  style: TextStyle(
                  color:const Color(0xff488011),
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp)),
              SizedBox(width: 10.w,),

               Text("${beforeDisc.toString()}ر.س",
              style: TextStyle(
                  color:kPrimaryColor,
                  fontWeight: FontWeight.w300,
                  fontSize: 14.sp,
                  decoration: TextDecoration.lineThrough) ),
              SizedBox(width: 4.w,),

              GestureDetector(
                onTap: onPressed,
                child: Container(
                  width: 26.w,
                  height: 29.h,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                    color:const Color(0xff61B80C),),
                  child:  Icon(Icons.add,color: Colors.white,size: 25.r,),),
              ),
              SizedBox(width: 2.w,),


            ],
        ),
      ],),)
        ,

         ]) ;
  }
}
