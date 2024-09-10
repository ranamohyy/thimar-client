
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thimar/core/logic/helper_method.dart';
import 'package:thimar/views/main/data/finish_order_bloc/finish_order_bloc.dart';
import '../../../../constans.dart';
import '../../../../core/design/app_image.dart';
import '../../../my_account/presentation/views/add_address/view.dart';
import '../../../my_account/presentation/views/addresses/view.dart';

class AddressView extends StatefulWidget {
  const AddressView ({super.key,required this.event});
   final FinishOrderEvent event;
  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  // String selectedValue = "Select a value";
  @override
  Widget build(BuildContext context) {
    return  Column(children:[
      Row(
      children: [
        Text("اختر عنوان التوصيل",
          style:  kTextStyle20.copyWith(color: kPrimaryColor),
        ),
        const Spacer(),
             GestureDetector(
           onTap: (){
            navigateTo(const AddAddressView());
           },
           child:
           const  AppImage(url:"containerPlus.png",
            height: 30,width: 30,),),
             ],),
      const SizedBox(height: 12,),
        GestureDetector(
          onTap: (){
            displayBottomAddressSheet();
          },
          child: Container(
            height: 35.h,
              width: 400.w,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const[BoxShadow(blurRadius: 0.2)],
                borderRadius:BorderRadius.all(Radius.circular(12.r)) ,),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( widget.event.addressId.toString(),style: kTextStyle16light,maxLines: 2,overflow:TextOverflow.ellipsis ,),
                  Center(child: Icon(Icons.arrow_drop_down,color: Colors.black,size: 24.r,))
                ],
              ),
            ),

              ),
        )


   ], );
  }
  void displayBottomAddressSheet()async {

    final result = await showModalBottomSheet<String>(
      context:context,
      builder:(BuildContext context) {
      return const AddressesView(type: 'شيت',);},
      shape:const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(30) )
      ),

    );
    if (result != null) {
      setState(() {
        widget.event.addressId = result;  // Update the container text with the selected value
      });
    }
  }
  }
