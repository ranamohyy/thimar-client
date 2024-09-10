import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/views/main/widgets/custom_app_bar.dart';
import 'package:thimar/views/my_account/data/my_profile/bloc.dart';
import '../../../../../constans.dart';
import '../../../../../core/design/app_input.dart';
import '../../../../sheets/editPasswordSheet.dart';

  class MyProfileView extends StatefulWidget {
    const MyProfileView({super.key});
     @override
    State<MyProfileView> createState() => _MyProfileViewState();
  }
class _MyProfileViewState extends State<MyProfileView> {
   final _form =GlobalKey<FormState>();
   final bloc= GetIt.I<EditProfileBloc>();
   final myProfile= GetIt.I<MyProfileBloc>()..add(GetProfileEvent());
   final event= EditProfileEvent();
   final passEvent= EditPasswordEvent();



   @override
    Widget build(BuildContext context) {
      return
        Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(text: 'البيانات الشخصية',),
        body: SafeArea(
          child: SingleChildScrollView(
            padding:const EdgeInsets.all(8),
            child: Form(
              key:_form ,
              child: BlocBuilder(
                bloc: myProfile,
                builder:(context, state) {
                  if (state is ProfileLoadingState) {
                    return const AppLoadingView();
                  } else if (state is ProfileFailureState) {
                    return Text(state.errMessage);
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            pickImage();
                          },
                          child:
                          Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  height: 108.h,
                                  width: 105.w,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.transparent,
                                        borderRadius: BorderRadius.circular(
                                            25.r)),
                                    child: event.image != null ?
                                    Image.file(event.image!,) :
                                    AppImage(url: CachHelper.image.toString(),
                                      borderRadius: BorderRadius.circular(25.r),
                                    ),

                                  ),
                                ),

                                const Positioned(
                                    child: AppImage(url: 'pick_photo.png',
                                      color: Colors.white,
                                      height: 35,
                                      width: 35,)
                                )
                              ]),
                        ),
                      ),
                      const SizedBox(height: 14,),
                      Text(
                        CachHelper.userName.toString(), style: kTextStyle15,),
                      const SizedBox(height: 6,),
                      Text(
                        CachHelper.phoneNumber.toString(),
                        style: kTextStyle16light,
                      ),
                      const SizedBox(height: 14,),
                      TextFormField(
                        controller: event.nameController,

                        validator: (value) {
                          if (value!.isEmpty) {
                            return "name must be not empty";
                          } else {
                            return null;
                          }
                        }, decoration: InputDecoration(
                          prefixIcon: Container(
                            height: 0.122,
                            margin: const EdgeInsets.all(12.5),
                            child: const AppImage(url: "User.png"
                                , width: 0.1, height: 0.122
                            ),
                          ),
                          hintStyle: kTextStyle16light,
                          hintText: CachHelper.userName

                      ),
                      ),
                      SizedBox(height: 16.h,),
                      AppInputView(
                        // label:Text( CachHelper.phoneNumber!),
                    hintText: CachHelper.phoneNumber,
                        hintStyle: kTextStyle16light,
                        controller: event.phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "password must be not empty";
                          } else if (value.length < 7) {
                            return "password must ba more than 7";
                          }
                          else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 16.h,),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return ('برجاء ادخال اسم المدينه');
                          }
                          return null;
                        },
                        controller: event.cityController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(
                              r'[\u0600-\u06FF]'))
                        ],
                        decoration: InputDecoration(
                          prefixIcon: Container(
                            height: 0.122,
                            margin: const EdgeInsets.all(12.5),
                            child: const AppImage(url: "flag.png"
                                , width: 0.1, height: 0.122
                            ),
                          ),
                          hintText:' اسم المدينه',
                          hintStyle: kTextStyle15light,
                        ),
                      ),
                      SizedBox(height: 12.h,),
                  GestureDetector(
                    onTap: (){
     showModalBottomSheet(
     backgroundColor: Colors.white,
     context: context, builder: (context) =>const EditProfileSheet()

     );
     },
                    child: Container
                      (height: 50,
                      padding:const EdgeInsets.symmetric(horizontal: 10),
                      decoration:BoxDecoration(
                        color: Colors.white,
                        boxShadow:const [ BoxShadow(

                        )],
                        shape: BoxShape.rectangle,
                        borderRadius:  BorderRadius.circular(22.r),


                      ),


                      child:const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('تغيير كلمه المرور',style:kTextStyle15light ,),
                          Spacer(),
                    Icon(Icons.arrow_circle_left_outlined)]),

                    ),
                  ),

                      SizedBox(height: 14.h,),
                      BlocConsumer<EditProfileBloc,ProfileStates>(bloc: bloc,
                        listener: (context, state) {
                          if(state is EditProfileSuccessState){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.msg)));
                          }if(state is EditProfileFailureState){
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errMessage)));
                          }
                        },
                        builder:(context, state) {
                          if (state is EditProfileLoadingState) {
                            return const AppLoadingView();
                          }
                          return ElevatedButton(onPressed: () {
                            final valid = _form.currentState!.validate();
                            if (valid){
                              bloc.add(event);
                          }
                          },
                              child: const Text(
                                "تعديل البيانات", style: TextStyle(color: Colors
                                  .white),));

                        } ),

                    ],
                  );
                })
                ),
              ),
            ),
          );



    }
   Future<XFile?> pickImage()async{
     final ImagePicker imagePicker = ImagePicker();

   final returnedImage=   await imagePicker.pickImage(source:ImageSource.gallery);
setState(() {
  // selectedImage= File(returnedImage!.path);
  event.image= File(returnedImage!.path);

});
return null;

   }


}


