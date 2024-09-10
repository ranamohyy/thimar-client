import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constans.dart';
import '../../../core/design/app_image.dart';

  class ItemBuilderForOrder extends StatelessWidget {
  const ItemBuilderForOrder({super.key, required this.orderNumber, required this.date, required this.clientName, required this.price, required this.statusOrder,});
  final int orderNumber;
  final DateTime? date;
  final String clientName;
  final String price;
  final String statusOrder;
  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            child: Column(
              children: [
                SizedBox(height: 16.h,),
                Row(children: [
                  Text("طلب #$orderNumber",

                      style:kTextStyle18),
                  const Spacer(),
                  Container(height: 25.h,width: 90.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color:getBackgroundColor(statusOrder)


                      ),
                      child:
                      Center(
                        child: Text(statusOrder,
                            style:
                            kTextStyle15.copyWith(color:getTextColor(statusOrder))),
                      )),
                ] ),
                SizedBox(height: 12.h,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(

                      " ${date?.toLocal().toString().split(' ')[0]}",
                      style:kTextStyle15light),
                ),
                Divider(thickness: 0.1.r,),
                Row(
                  children: [
                    AppImage(url:"orders.png",height: 50.h,width: 120.w,fit: BoxFit.fill,),
                    const Spacer(),
                    Text(price,
                        style:kTextStyle16
                    )

                  ],
                )



              ],
            ),
          ),

        ] );

  }
}
Color getBackgroundColor(statusOrder) {
  if (statusOrder=='pending') {
    return kPrimaryColor.withOpacity(0.2);
  } else if(statusOrder=='canceled') {
    return const Color(0xffFFE4E4);}
  else if(statusOrder=='finished'){
    return const Color(0xffF3F3F3);
  }return const Color(0xffE6F5F0);
}
Color getTextColor(statusOrder) {
  if (statusOrder=='pending') {
    return kPrimaryColor;
  } else if(statusOrder=='canceled') {
    return  Colors.red;}
  else if(statusOrder=='finished'){
    return const Color(0xffA1A1A1);
  }return const Color(0xff2D9E78);
}
