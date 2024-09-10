import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/design/app_image.dart';

class CountrySheet extends StatefulWidget {
  final String flag;
  final String country;
  final double? height;
  final double? width;

  const CountrySheet({super.key, required this.flag, required this.country, this.height, this.width});

  @override
  State<CountrySheet> createState() => _CountrySheetState();
}

class _CountrySheetState extends State<CountrySheet> {
  final list = [
    "+966",
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(16),
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) =>

    GestureDetector(
      onTap: (){

      },
      child: Container(
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
            height: 50.h,
              width: 50.w,
              child: AppImage(url:
                widget.flag,
                height:widget.height ,
                width:widget.width ,),
            ),
            SizedBox(width: 10.w,),
            Text(list[index]),
          ],

        ),
      ),
    ),
      itemCount: list.length,

    );
  }
}
