import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/core/app_failure/custom_error_widget.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/views/my_account/data/my_profile/bloc.dart';
import '../../../../../constans.dart';
import '../../../../../core/design/app_image.dart';
import '../../../../../core/logic/cache_helper.dart';
import 'custom_app_bar.dart';
class BodyMyProfileView extends StatelessWidget {
   BodyMyProfileView({super.key});
final bloc = GetIt.I<MyProfileBloc>()..add(GetProfileEvent());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(

      bloc: bloc,
      builder: (context, state) {
        if(state is ProfileLoadingState){
          return const AppLoadingView();
        }
  else if(state is ProfileSuccessState){
          return
            Scaffold(
              extendBodyBehindAppBar: true,
              appBar:  CustomAppBar(text: 'profile'.tr()),
              body: SingleChildScrollView(
                padding:const EdgeInsets.all(12),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [


                      Center(
                        child: SizedBox(
                          height: 60.h,
                          width: 60.h,
                          child: Stack(
                            children: [
                              AppImage(url: CachHelper.image.toString(), height: 60.h,
                                width: 60.h,borderRadius: BorderRadius.circular(100), ),

                              const  Icon(CupertinoIcons.photo)
                            ],
                          ),
                        ),
                      ),

//             CircleAvatar(
//                        radius: 60,
//
// backgroundImage: NetworkImage( CachHelper.image.toString()),
//
//                  ),
//                  Center(child:
//                      _image!=null?
//                  CircleAvatar(
//                        radius: 60,
//
// backgroundImage: NetworkImage( CachHelper.image.toString(),)
//                  ):
//             Text(CachHelper.userName.toString(),
//                 style: kTextStyle15),),
                      const SizedBox(height: 10,),
                      Text(
                        CachHelper.phoneNumber.toString(),
                        style: kTextStyle15light,
                      ),
                      // Stack(
                      //       alignment: Alignment.center,
                      //       children: [
                      //         _image!=null?CircleAvatar(
                      //           radius: 60,
                      //           backgroundImage: MemoryImage(_image!),):
                      //
                      //       const  CircleAvatar(radius: 60,
                      //  backgroundImage: NetworkImage("https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?t=st=1709904691~exp=1709908291~hmac=cb09de02e174131ab5060db912a3e6df65cfb83f614d91a9ae8cb64944885571&w=740"),)
                      //      ,
                      //
                      //         Positioned(
                      //           child: IconButton(
                      //               onPressed: (){
                      //                 selectedImage();
                      //               },
                      //               icon:const Icon(Icons.camera_enhance),),
                      //         ),
                      //       ]),
                      // BodyMyProfileView(),
                      const SizedBox(height: 100,),
                      ElevatedButton(onPressed: (){},
                          child: const Text("تعديل البيانات"))
                    ],),
                ),
              ),
            );

        }else if (state is ProfileFailureState){
          return CustomErrorWidget(errMessage: state.errMessage);
        }return const SizedBox();

    },);
  }
}
