import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/core/logic/helper_method.dart';
import 'package:thimar/views/auth/data/confim_code/bloc.dart';
import 'package:thimar/views/auth/presentation/login/view.dart';
import '../../../main/home_nav/view.dart';
import '../../data/resend_code/resend_code_bloc.dart';
import '../new_password/view.dart';
import 'head_view_widget.dart';
class ConfirmCodeView extends StatefulWidget {
  const ConfirmCodeView({super.key, required this.phone, required this.type});
  final String phone;
  final String type;

  /// 'register' ,, 'reset_password'

  @override
  State<ConfirmCodeView> createState() => _ConfirmCodeViewState();
}
class _ConfirmCodeViewState extends State<ConfirmCodeView> {
  final CountDownController _controller = CountDownController();
  TextEditingController pinController = TextEditingController();
  final bloc = GetIt.I<ConfirmCodeBloc>();
  final blocresend = GetIt.I<ResendCodeBloc>();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child:
      SingleChildScrollView(padding:  EdgeInsetsDirectional.symmetric(horizontal: 18.h, vertical: 8.w), child: Form(key: _formKey, child: Column(children: [
              HeadWidget(phone: widget.phone, pinController: pinController,),
              BlocConsumer<ConfirmCodeBloc, ConfirmCodeStates>(
                bloc: bloc,
                listener: (context, state) {
                  if (state is ConfirmCodeSuccessState) {
                     if (widget.type == 'register') {
                      navigateTo(const HomeNavView(), keepHistory: false);
                    } else if (widget.type == 'forget_password') {
                     navigateTo( ResetPasswordView(phone: widget.phone,code:pinController.text ,), keepHistory: false);
                    }
                  } else if (state is ConfirmCodeFailureState) {
                    Fluttertoast.showToast(
                        msg: "القيمة المحددة حقل الكود غير موجودة",
                        fontSize: 12.sp,
                        backgroundColor: Colors.black,
                        textColor: Colors.white);
                  }
                },
                builder: (context, state) {
                  if (state is ConfirmCodeLoadingState) {
                    return const AppLoadingView();
                  }
                  return ElevatedButton(

                      onPressed: () {
                        bloc.add(
                        (
                          SendCodeEvent(
                              type: widget.type,
                              Code: '966',
                              registerCode: pinController.text,
                              PhoneNumber: widget.phone)

                        )
                        );
                        },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryColor),
                      child: Text(
                        "تأكيد الكود",
                        style: kTextStyle16.copyWith(color: Colors.white),
                      ));
                },
              ),
               SizedBox(height: 12.h),
               Center(
                child: Text("لم تستلم الكود ؟", style: kTextStyle16light),
              ),
               Center(
                child: Text("يمكنك إعادة إرسال الكود بعد",
                    style: kTextStyle16light),
              ),
               SizedBox(height: 10.h),
              CircularCountDownTimer(
                initialDuration: 0,
                textFormat: CountdownTextFormat.MM_SS,
                autoStart: true,
                controller: _controller,
                strokeWidth: 5.w,
                strokeCap: StrokeCap.round,
                isTimerTextShown: true,
                isReverse: false,
                onComplete: () {
                  const Text(
                    "لم تستلم الكود؟إعاده إرساله الأن",
                    style: kTextStyle15light,
                  );
                },
                width: 70.w,
                height: 70.h,
                duration: 60,
                fillColor: kPrimaryColor,
                ringColor: Colors.grey,
                backgroundColor: Colors.white,
              ),
              const SizedBox(height: 20),
          BlocConsumer<ResendCodeBloc,ResendCodeStates>(
            bloc: blocresend,
            listener: (context, state) {
              if (state is ResendCodeSuccessState) {
                if (widget.type == 'register') {
                  Fluttertoast.showToast(
                      msg: "تم الارسال بنجاح",
                      textColor: Colors.white,
                      backgroundColor: Colors.black,
                      fontSize: 12.sp
                  );
                } else if (widget.type == 'forget_password') {
                  Fluttertoast.showToast(
                      msg: "تم الارسال بنجاح",
                      textColor: Colors.white,
                      backgroundColor: Colors.black,
                      fontSize: 12.sp
                  );        }
              }
              else if (state is ResendCodeFailureState) {
                Fluttertoast.showToast(msg: "القيمة المحددة حقل الهاتف غير موجودة",
                    textColor: Colors.white,
                    backgroundColor: Colors.black,
                    fontSize: 12.sp);
              }
            },
            builder: (context, state) {
              if (state is ResendCodeLoadingState){
                return const AppLoadingView();
              }return OutlinedButton(

                  onPressed: (){
                    blocresend.add(ResendCodeEvent(
                    Code: '966',
                        type: widget.type,
                        phoneNumber: widget.phone,


                    ));
                  },

                  style:OutlinedButton.styleFrom( shape:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12.r)))),
                  child:const Text("إعادة الإرسال")

              );
            },



          ),

           SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "لديك حساب بالفعل ؟",
                    style: kTextStyle15light.copyWith(color: kPrimaryColor),
                  ),
                  TextButton(
                    onPressed: () {
                      navigateTo(const LoginView());
                    },
                    child: const Text("تسجيل الدخول", style: kTextStyle17),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
