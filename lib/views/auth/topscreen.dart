

import 'package:flutter/cupertino.dart';
import 'package:thimar/core/design/app_image.dart';

class TopScreen extends StatelessWidget {
  final String text1;
  final String text2;


  const TopScreen({super.key, required this.text1, required this.text2});
  @override
  Widget build(BuildContext context) {
    return Column(
       crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Center(
        child:
          AppImage(url:"logo.png",
          height: 190,
          width: 190,),),
          Text(text1,style: TextStyle(
          color: Color(0xff4C8613),
        fontSize: 20,
        fontWeight: FontWeight.bold),),
          Text(text2, style: TextStyle(
              color: Color(0xff707070),
              fontWeight: FontWeight.bold,
              fontSize: 16)),


    ],);
  }
}
