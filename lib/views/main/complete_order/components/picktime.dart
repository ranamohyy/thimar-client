import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/views/main/data/finish_order_bloc/finish_order_bloc.dart';

class PickCalenderTime extends StatefulWidget {
const   PickCalenderTime ({super.key,required this.event});
final  FinishOrderEvent event;

   @override
  State<PickCalenderTime> createState() => _PickCalenderTimeState();
}

class _PickCalenderTimeState extends State<PickCalenderTime> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize:MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 60.h,
          width: 160.w,
          child:
          OutlinedButton(
            style: OutlinedButton.styleFrom(maximumSize: Size(100.w, 150.h) ,),
            onPressed: ()async{
              final TimeOfDay? picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                  initialEntryMode: TimePickerEntryMode.dial
              ); if (picked != null && picked !=   widget.event.selectTime){
                setState(() {
                  widget.event.selectTime = picked;
                });}
            },
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Text( style: kTextStyle15,
                     widget.event.selectTime == null
                    ? 'No time selected'
                    : widget.event.selectTime.format(context)
                 ),
                AppImage(url: 'pick_time.png',color: kPrimaryColor,height: 24.h,width: 24.w,),
              ],
            ),

          ),
        ),
          SizedBox(
      width: 180.w,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
        fixedSize: Size.fromHeight(60.h),),

        onPressed: ()
      {
        selectDate(context);
      },

      child:
       Row(
        mainAxisSize:MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          // 2024-09-09
           Text(  widget.event.picked== null?
              'No date selected'
           : '${
       DateFormat('yyyy-MM-dd','en').format(  widget.event.picked)} '
               //
               ,style: kTextStyle15.copyWith(fontSize: 14)),
           const Spacer(),
          AppImage(url: 'pick_calender.png'
              ,color: kPrimaryColor,height: 20.h,width: 24.w,)
      ],
      ),
      ),
    ),

    


    ],);
  }



  Future<void> selectDate(context)async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2100));
    if (picked != null && picked != widget.event.picked) {
      setState(() {
        widget.event.picked = picked;
      });
      print(widget.event.picked);
    }
  }
  // Future<void> sendDateTimeToServer() async {
  //   if (event.picked!= null && event.picked != null) {
  //     DateTime finalDateTime = DateTime(
  //       event.picked.year,
  //       event.picked.month,
  //       event.picked.day,
  //       event.picked.hour,
  //       event.picked.minute,
  //     );}}
}
