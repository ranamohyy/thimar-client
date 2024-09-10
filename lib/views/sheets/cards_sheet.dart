
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/logic/helper_method.dart';
import 'package:thimar/views/main/home_nav/view.dart';
import 'package:thimar/views/main/widgets/custom_Credit_card.dart';

import '../main/home_nav/my_orders/view.dart';
List <String> visa=[
  "visa.png",
  "visa (2).png"];
Future displayBottomVisaSheet(BuildContext context) {
  return showModalBottomSheet(
     isScrollControlled: true,
      context:context,
      builder:(context) {
       return   SingleChildScrollView(
            child: SizedBox(
              height: 280.h,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.0.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Center(
                      child: Text("البطاقات المحفوظه", style: kTextStyle16),
                    ),
                    SizedBox(
                      height: 150.h,
                      width: 200.w,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(),
                        itemCount:2,
                          shrinkWrap: true,
                          physics: const AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                          const  SizedBox(
                                height: 90,width: 200,
                                child: CustomCreditCard(
                                autovalidateMode: AutovalidateMode.disabled,),
                              ),

                                 ),
                          ),
                    const Row(children: [
                      AppImage(url: "containerPlus.png",height: 25,width: 25,),
                      Text("إضافة بطاقة دفع")],),
                    TextButton(
                      style: const ButtonStyle(backgroundColor:WidgetStatePropertyAll(kPrimaryColor) ),
                      onPressed: (){},
                      
                    child:const Text("تأكيد الاختيار", style: kTextStyle14,),)

                  ],
                ),
              ),
            ),

      );}
  );
}




