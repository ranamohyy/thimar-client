import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/constans.dart';

import '../../core/design/app_image.dart';
import '../../core/logic/helper_method.dart';
import '../main/home_nav/my_orders/view.dart';
import '../main/home_nav/view.dart';

Future displayBottomSuccessOrder(BuildContext context){
  return showModalBottomSheet(context: context,
      builder: (context) => Container(
        height: 380.h,
        decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.only(topLeft: Radius.circular(12.r,),topRight: Radius.circular(12.r))
        ),
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 8.h,),
            const AppImage(url: "successOrder.png",height: 200,width: 250,),
            SizedBox(height: 12.h,),
           const Text("شكرا لك لقد تم تنفيذ طلبك بنجاح",
                style:kTextStyle16),
            SizedBox(height: 12.h,),
            const Text("يمكنك متابعة حالة الطلب او الرجوع للرئسيية",
                style:kTextStyle16light),
            const SizedBox(height: 18,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 20,),

                SizedBox(
                    width: 150,
                    child: ElevatedButton(onPressed: ()
                    {navigateTo(const MyOrdersView());}, child: const Text("طلباتي",style: kTextStyle14,))),
                const SizedBox(width: 10,),
                SizedBox(
                    width: 150,
                    child: ElevatedButton(onPressed: (){
                      navigateTo(const HomeNavView())
                      ;}, child: const Text("الرئيسية",style: kTextStyle14)))

              ],
            )
          ],),
      ));
}
