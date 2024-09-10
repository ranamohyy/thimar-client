import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/constans.dart';

import '../../../core/design/app_image.dart';
class ItemAddressBuilder extends StatefulWidget {
   ItemAddressBuilder({super.key,required this.id,
     required this.phone,required this.type,required this.address,required this.description,
   required this.onDelete,required this.onEdit
   });
   int id;
String type;
String phone;
String address;
String description;
   void Function()? onDelete;
   void Function()? onEdit;

  @override
  State<ItemAddressBuilder> createState() => _ItemAddressBuilderState();
}

class _ItemAddressBuilderState extends State<ItemAddressBuilder> {
  @override
  Widget build(BuildContext context) {
    return                 Container(

      padding: EdgeInsets.only(right: 12.w,left:12.w,top: 8.h),
      height: 180.h,
      width: double.infinity,
      decoration: BoxDecoration(

          color: Colors.white,
          boxShadow: const[
            BoxShadow(color: kPrimaryColor, spreadRadius: 1)
          ],
          borderRadius: BorderRadius.circular(16)),
      child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(widget.type,
                    style:
                kTextStyle16.copyWith(fontWeight: FontWeight.w600)),
               const Spacer(),
               GestureDetector(
                 onTap: widget.onDelete,
                 child: const  AppImage(url:
                  "delete_icon.png",
                    width: 30,
                    height: 30,
                  ),
               ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: widget.onEdit,
                  child: const AppImage(url:
                  'edit_address.png',
                    width: 30,
                    height: 30,
                  ),
                ),
              ],
            ),
            Text(
              widget.address,
              style:kTextStyle14.copyWith(color: kPrimaryColor,fontWeight: FontWeight.w400)
            ),
            Text(widget.description,
                style: kTextStyle15light

                ),
            Text(widget.phone,
                style: kTextStyle15light),
          ]),
    );

  }
}
