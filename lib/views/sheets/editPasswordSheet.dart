import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/views/my_account/data/my_profile/bloc.dart';

import '../../../../../constans.dart';
import '../../../../../core/design/app_image.dart';
import '../../../../../core/design/app_loading.dart';

class EditProfileSheet extends StatefulWidget {
  const  EditProfileSheet({super.key});

  @override
  State<EditProfileSheet> createState() => _EditProfileSheetState();
}

class _EditProfileSheetState extends State<EditProfileSheet> {
   final _form =GlobalKey<FormState>();

  final editPassword= GetIt.I<EditPasswordBloc>();

  final event= EditPasswordEvent();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData=MediaQuery.of(context);
    return  SizedBox(
            height: 340,
            width: MediaQuery
                .of(context)
                .size
                .width,
            child:
            Form(
              key:  _form,
                child: Padding(
                  padding:   const EdgeInsets.only(top: 20.0,left: 12,right: 12,bottom: 4),

                  child: Column(
                      children: [
                        TextFormField(
                            controller: event.oldPasswordController,
                            keyboardType: TextInputType.phone,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "password must be not empty";
                              } else if (value.length < 7) {
                                return "password must be more than 7";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              prefixIcon: Container(
                                height: 0.122,
                                margin: const EdgeInsets.all(12.5),
                                child: const AppImage(url: "Unlock.png"
                                    , width: 0.1, height: 0.122
                                ),
                              ),
                              hintText:'old password',
                              hintStyle: kTextStyle15light,
                            ),
                          ),
                        SizedBox(height: 12.h,),
                        TextFormField(
                          controller: event.passwordController,
                          keyboardType: TextInputType.phone,
                          validator: (newValue) {
                            if (newValue!.isEmpty) {
                              return "password must be not empty";
                            } else if (newValue.length < 7) {
                              return "password must be more than 7";
                            } else {
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              height: 0.122,
                              margin: const EdgeInsets.all(12.5),
                              child: const AppImage(url: "Unlock.png"
                                  , width: 0.1, height: 0.122
                              ),
                            ),
                            hintText: 'new password',
                            hintStyle: kTextStyle15light,
                          ),
                        ),
                        SizedBox(height: 12.h,),
                        TextFormField(
                          controller: event.passwordConfirmationController,
                          keyboardType: TextInputType.phone,
                          validator: (confirmValue) {

                            if (confirmValue!.isEmpty) {
                              return "password must be  not empty";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Container(
                              height: 0.122,
                              margin: const EdgeInsets.all(12.5),
                              child: const AppImage(url: "Unlock.png"
                                  , width: 0.1, height: 0.122
                              ),
                            ),
                            hintText: 'confirmPassword',
                            hintStyle: kTextStyle15light,
                          ),
                        ),                        SizedBox(height: 12.h,),

                        BlocConsumer<EditPasswordBloc,ProfileStates>(bloc: editPassword,
                            listener: (context, state) {
                              if(state is EditPasswordSuccessState){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.msg)));
                              }if(state is EditPasswordFailureState){
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
                              }
                            },
                            builder:(context, state) {
                              if (state is EditPasswordLoadingState) {
                                return const AppLoadingView();
                              }
                              return ElevatedButton(onPressed: () {
                                final valid = _form.currentState!.validate();
                                if (valid){
                                  editPassword.add(event);
                                }


                              },
                                  child: const Text(
                                    "تعديل كلمه المرور", style: TextStyle(color: Colors
                                      .white),));

                            } ),


                      ]),
                )));
  }
}
