import 'package:flutter/material.dart';
import 'package:thimar/core/logic/helper_method.dart';

import '../../core/design/app_image.dart';
import '../sheets/countries.dart';

class Tagroba extends StatelessWidget {
  const Tagroba({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child:
       Row(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           GestureDetector(
             onTap:(){showModalBottomSheet(context: context,
      builder: (context) => CountrySheet(
        country:"Egypt" ,
        flag:"saudi.png",height: 10,width: 10 ,
      ),);},

             child: Container(
                height: 60,
                 width: 70,
               child: AppImage(url:"saudi.png",
                 height:60,
                 width:60,),

             ),
           ),
           TextFormField(


             decoration: InputDecoration(
               label: Text("رقم الجوال"),
               prefixIcon:AppImage(url:"Phone.png",height: 22,width: 22),


           ),
           ),
         ],
       )





    );
  }
}
