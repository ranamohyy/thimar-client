import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:thimar/constans.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../core/design/app_loading.dart';
import '../../my_account/data/add_address/add_address_bloc.dart';

class BodyAddAddressWidget extends StatefulWidget {
  BodyAddAddressWidget({super.key, this.currentLocation, });

  LatLng? currentLocation;

  @override
  State<BodyAddAddressWidget> createState() => _BodyAddAddressWidgetState();
}

class _BodyAddAddressWidgetState extends State<BodyAddAddressWidget> {
  late final String type;
  final bloc = GetIt.I<AddAddressBloc>();
  final event = GetAddAddressEvent();
  final _form = GlobalKey<FormState>();
  late List<String>? labels = ['العمل', 'المنزل'];
  bool isPressed=false;


  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return Padding(
      padding: mediaQueryData.viewInsets,
      child: Form(
        key: _form,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(children: [
                SizedBox(
                  height: 70,
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'phone must be valid';
                      }
                      return null;
                    },
                    controller: event.type,
                    decoration: const InputDecoration(
                        hintText: "نوع العنوان", hintStyle: kTextStyle16light),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: ToggleSwitch(
                        borderWidth: 0.1,
                        dividerMargin: 10,
                        customTextStyles: [
                          TextStyle(
                              fontSize: 15.sp,
                              fontFamily: kTextFamily,
                              fontWeight: FontWeight.bold)
                        ],
                        minWidth: 70,
                        minHeight: 40,
                        labels: labels,
                        onToggle: (index) {
                          if (index == 1) {
                            event.type.text = 'المنزل';
                          }
                          if (index == 0) {
                            event.type.text = 'العمل';
                          }
                        },
                        customHeights: [100.h, 100.h],
                        customWidths: [100.w, 100.w],
                        totalSwitches: 2,
                        activeBgColor: const [Color(0xff4C8613)],
                        activeFgColor: Colors.white,
                        inactiveBgColor: Colors.white,
                        inactiveFgColor: const Color(0xff4C8613),
                        cornerRadius: 15.r,
                        borderColor: const [
                          Color(0xffE9E9E9),
                          Color(0xffE9E9E9)
                        ],
                        radiusStyle: true,
                      ),
                    ),
                  ],
                ),
              ]),
              const SizedBox(
                height: 2,
              ),
              TextFormField(
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'phone must be valid';
                  }
                  return null;
                },
                controller: event.phone,
                decoration: const InputDecoration(
                    hintText: "أدخل رقم الجوال", hintStyle: kTextStyle16light),
              ),
              const SizedBox(
                height: 14,
              ),
              TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'phone must be valid';
                    }
                    return null;
                  },
                  controller: event.description,
                  decoration: const InputDecoration(
                      hintText: "الوصف", hintStyle: kTextStyle16light)),
              BlocConsumer(
                  bloc: bloc,
                  listener: (context, state) {
                    if (state is AddAddressSuccessState) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                            "تم اضافه العنوا بنحاح",
                            style: kTextStyle14,
                          ),
                          backgroundColor: kPrimaryColor));
                    } else if (state is AddAddressFailureState) {
                      Fluttertoast.showToast(
                        msg: "لم يتم",
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is AddAddressLoadingState) {
                      return const AppLoadingView();
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(children: [
                          Checkbox(
                              activeColor: Colors.black,
                              tristate: true,
                              value: isPressed,
                              onChanged: (newValue) {
                                    isPressed =! isPressed;
                                setState(() {});
                                if(newValue == true){
                                  event.isDefault=1;
                                }else{
                                  event.isDefault=0
                                  ;}
                                    print('===========================${event.isDefault}');
                                    print('===========================${isPressed}');

                              }),
                          const SizedBox(
                            width: 8,
                          ),
                          const Text(
                            "العنوان الرئيسي؟",
                            style: kTextStyle15,
                          )
                        ]),

                    ElevatedButton(
                    onPressed: () {
                    final valid = _form.currentState!.validate();
                    if (valid && widget.currentLocation != null) {
                    event.latlng = widget.currentLocation;
                    event.isDefault=1 ;
                    bloc.add(event);
                    // navigateTo( const AddressesView(),keepHistory: true);
                    print('===========================${event}');
                    }
                    },
                    child:
                    const Text("إضافة العنوان", style: kTextStyle14),


                    )]);
                    })
                      ],

    )

  )

          ),


    );
  }
}
