import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/core/logic/helper_method.dart';
import 'package:thimar/views/auth/data/register/bloc.dart';
import 'package:thimar/views/auth/presentation/confirm_code/view.dart';
import 'package:thimar/views/auth/presentation/login/view.dart';
import '../widgets/custom_top_auth.dart';
class RegisterView extends StatefulWidget {
  const RegisterView({super.key});
  @override
  State<RegisterView> createState() => _RegisterViewState();
}
class _RegisterViewState extends State<RegisterView> {
  final _form= GlobalKey<FormState>();
  final nameController=TextEditingController() ;
  final cityController=TextEditingController() ;
  final passwordController=TextEditingController() ;
  final phoneController=TextEditingController() ;
  final passwordConfirmationController=TextEditingController();
   String selectedCode= '966';
  final bloc= GetIt.I<RegisterBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          padding:  EdgeInsets.symmetric(horizontal:12.w, vertical: 6.h),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                      SizedBox(height: 30.h,),
                     const CustomTopAuth(text1:"مرحبا بك مرة أخرى" , text2: "يمكنك تسجيل حساب جديد الأن")
                     , SizedBox(height: 12.h,),
                     TextFormField(
                       controller:nameController ,
                   validator: (value) {
                   if( value!.isEmpty){
                  return "name must be not empty";
                }else {return null;}
              },   decoration: InputDecoration(
                       prefixIcon: Container(
                         height: 0.122,
                         margin:const EdgeInsets.all(12.5),
                         child: const AppImage(url:"User.png"
                             ,width: 0.1,height: 0.122
                         ),
                       ),
                       hintStyle:kTextStyle15light,
                       hintText:"اسم المستخدم"

                  ),
            ),
                      SizedBox(height: 12.h,),
                     TextFormField(
                       controller: phoneController,
                       keyboardType: TextInputType.phone,
                       validator: (value) {
                         if (value!.isEmpty){
                          return "phone must be not empty";
                            }else {
                              return null;
                             }
                            },
                       decoration: InputDecoration(
                           prefixIcon: Container(
                             height: 0.122,
                             margin:const EdgeInsets.all(12.5),
                             child: const AppImage(url:"Phone.png"
                                 ,width: 0.1,height: 0.122
                             ),
                           ),
                           hintStyle:kTextStyle15light,
                           hintText:"رقم الجوال"
                       ),),
                      SizedBox(height: 12.h,),
                     TextFormField(
                       controller: cityController,
                        decoration:  InputDecoration(
                          prefixIcon: Container(
                          height: 0.122,
                          margin:const EdgeInsets.all(12.5),
                          child: const AppImage(url:"flag.png"
                              ,width: 0.1,height: 0.122
                          ),
                        ),
                            hintText:"المدينة" ,
                            hintStyle: kTextStyle15light,
                        ),
            ),
                      SizedBox(height: 12.h,),
                      TextFormField(
                         controller: passwordController,
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value!.isEmpty){
                  return "password must be not empty";
                }else if (value.length<7){
                  return "password must be more than 7";
                }else {
                  return null;
                }
              } ,
              decoration: InputDecoration(
                  prefixIcon: Container(
                    height: 0.122,
                    margin:const EdgeInsets.all(12.5),
                    child: const AppImage(url:"Unlock.png"
                        ,width: 0.1,height: 0.122
                    ),
                  ),
                  hintText:" كلمة المرور" ,
                  hintStyle: kTextStyle15light,
              ),
            ),
                       SizedBox(height: 12.h,),
              TextFormField(
                controller: passwordConfirmationController,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value!.isEmpty){
                    return "password must be not empty";
                  }else if (value.length<7){
                    return "password must be more than 7";
                  }else {
                    return null;
                  }
                } ,
                decoration: InputDecoration(
                  prefixIcon: Container(
                    height: 0.122,
                    margin:const EdgeInsets.all(12.5),
                    child: const AppImage(url:"Unlock.png"
                        ,width: 0.1,height: 0.122
                    ),
                  ),
                  hintText:"تأكيد كلمة المرور" ,
                  hintStyle: kTextStyle15light,
                ),
              ),
                SizedBox(height: 14.h,),
              BlocConsumer(
                     bloc: bloc,
                     listener: (context, state) {
                       if (state is RegisterSuccessState){
                         Fluttertoast.showToast(
                             msg:"تم التسجيل بنجاح  رجاء تفعيل حسابك ",
                             fontSize: 15.sp,
                             backgroundColor: Colors.black,
                             textColor: Colors.white);
                         navigateTo(ConfirmCodeView(
                           type: 'register',
                             phone:phoneController.text));
                       }
                       if (state is RegisterFailureState){
                         Fluttertoast.showToast
                           (msg: "قيمة حقل الهاتف مُستخدمة من قبل.",
                             fontSize: 15.sp,backgroundColor: Colors.black,
                           textColor: Colors.white



                          );
                       }
                     },
                    builder: (context, state) {
                       if (state is RegisterLoadingState){
                         return const AppLoadingView();
                       }
                    return ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                     backgroundColor: kPrimaryColor,
                                       shape: RoundedRectangleBorder(
                                     borderRadius: BorderRadiusDirectional.circular(16.r),

                                   )),
                                     onPressed: () {
                                     final valid=  _form.currentState!.validate() ;
                                       if (valid) {bloc.add(
                                           RegisterEvent(

                                           passwordConfirmation:passwordConfirmationController.text ,
                                           code: selectedCode,
                                           fullName:nameController.text,
                                           phoneNumber:phoneController.text ,
                                           city:cityController.text ,
                                           password:passwordController.text ));
                                        }
                         },

                                           child:  Text(
                                       "تسجيل",
                                       style: kTextStyle16.copyWith(color: Colors.white),
                                     ),


                    );

                     }
                   ),
                   const SizedBox(height: 8,),
                  Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const Text(
                  "لديك حساب بالفعل ؟",
                  style: TextStyle(
                    fontFamily: kTextFamily,
                      fontWeight: FontWeight.w300, color: Color(0xff4C8613)),
                ),
                TextButton(
                  onPressed: () {
                    navigateTo(const LoginView());
                  },
                  child:const Text(
                    "تسجيل الدخول",
                    style: TextStyle(
                      fontFamily: kTextFamily,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff4C8613),
                    ),
                  ),
                )
              ],
            )
      ],
    ),
          ),
        ));
  }
}
