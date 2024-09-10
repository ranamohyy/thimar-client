import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/views/main/data/show_cart_bloc/bloc.dart';
import '../../../constans.dart';
import '../../../core/design/app_image.dart';
import '../../../core/logic/helper_method.dart';
import '../cart/view.dart';
import 'Search_bar.dart';
class CustomAppBarHome extends StatelessWidget implements PreferredSizeWidget{
  int? id;
   CustomAppBarHome({super.key,  this.id});


  @override
  Widget build(BuildContext context) {
    return  AppBar(
      elevation: 0,
    backgroundColor: Colors.white,
      leading:
       Padding(
         padding: const EdgeInsets.symmetric(horizontal: 8.0),
         child: Row(
          mainAxisSize: MainAxisSize.min,
            children: [
                AspectRatio(
                 aspectRatio:20.w/20.h ,
                 child:  AppImage(url: "logo.png",
                  height: 20.h,
                  width: 15.w,),
               ),
              SizedBox(width: 4.w,),
              Text(
                  "سلة ثمار",
                  style: kTextStyle16,
                textAlign: TextAlign.center,
              ),


            ]),
       ),
      leadingWidth: 140.w,
      title:
       Padding(
        padding: EdgeInsetsDirectional.only(top: 5.h
        ),
        child: const Text("   التوصيل إلى ",
            style: kTextStyle18,

        ),
      ),

      centerTitle: true,
      actions: [
        Padding(
          padding:  EdgeInsetsDirectional.only(end: 8.h),
          child: IconButton(
              onPressed:
                  (){
                navigateTo(
                       CartView());},
              icon:const Icon( Icons.shopping_cart,),
              color:const Color(0xff4C8613)),),

      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(50);
}
