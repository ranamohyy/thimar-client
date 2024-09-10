import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/design/app_image.dart';
import '../../constans.dart';
import '../../views/sheets/countries.dart';

class AppInputView extends StatelessWidget {
  final TextEditingController controller;
  final double ?width;
  final double ?height;
  final Widget? prefixIcon;
  final String? initialValue;
  final String? hintText;
  final TextInputType? keyboardType;
  final TextStyle? hintStyle;
  final String? Function(String ?value)validator;
const AppInputView ({super.key,this.hintText, this.hintStyle, this.prefixIcon,this.initialValue,
  this.width, required this.validator, this.keyboardType, required this.controller, this.height, });
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child:
      TextFormField(
        initialValue: initialValue,
keyboardType: TextInputType.phone,
        validator:validator ,
             controller:controller ,
        decoration: InputDecoration(
          prefixIcon: Container(
            height: 0.122,
            margin:const EdgeInsets.all(12.5),
            child: const AppImage(url:"Phone.png"
                ,width: 0.1,height: 0.122
            ),
          ),
          hintStyle:hintStyle??kTextStyle15light,
          hintText:hintText??"رقم الجوال" ,
          icon:   GestureDetector (
            onTap: ()async{
              await showModalBottomSheet(context: context,
                builder: (context) => CountrySheet(
                  country:"Egypt" ,
                  flag:"saudi.png",height: 10.h,width: 10.w ,
                ),);
            },
            child: Container(
                height: 60.h,
                width: 70.w,
                child:
                AppImage(
                  url: "saudi.png",
                  height:height,
                  width:width,)
            ),
          ),
         ),
          ),
    );

}

}