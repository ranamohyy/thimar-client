import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/core/logic/cache_helper.dart';
import 'package:thimar/views/main/widgets/custom_app_bar.dart';
import 'package:thimar/views/main/complete_order/components/payment.dart';
import 'package:thimar/views/main/complete_order/components/picktime.dart';
import 'package:thimar/views/main/data/finish_order_bloc/finish_order_bloc.dart';
import 'package:thimar/views/main/data/show_cart_bloc/bloc.dart';
import '../../sheets/finish_order_success_sheet.dart';
import 'components/addres.dart';

class CompleteOrderView extends StatefulWidget {
  const CompleteOrderView ({super.key});

  @override
  State<CompleteOrderView> createState() => _CompleteOrderViewState();
}

class _CompleteOrderViewState extends State<CompleteOrderView> {
  TextEditingController dateController=TextEditingController();
final bloc= GetIt.I<ShowCartBloc>()..add(ShowCartEvent());
final finishOrder= GetIt.I<FinishOrderBloc>();
final event= FinishOrderEvent();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
      BlocConsumer<FinishOrderBloc,FinishOrderStates>(
        bloc: finishOrder,
        listener:(context, state) {
          if(state is FinishOrderLoading){
             const AppLoadingView();
          }
          else if(state is FinishOrderSuccess){
            Fluttertoast.showToast(msg: state.msg);
            displayBottomSuccessOrder(context);
          }
          else if(state is FinishOrderFailure){
            Fluttertoast.showToast(msg: state.errMessage);
          }
        } ,
        listenWhen: (previous, current) => current is FinishOrderLoading|| current is FinishOrderSuccess||current is FinishOrderFailure
       , builder:(context, state) {
          return  Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              finishOrder.add(event);


            },
                child: Text("finishOrder".tr(), style:kTextStyle14)),
          );
        }

      ),

      extendBodyBehindAppBar: true,
      appBar:  CustomAppBar(text: "completeOrder".tr(),) ,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment:CrossAxisAlignment.stretch ,
              children: [
            const  SizedBox(height: 10,),

              Text(CachHelper.userName!,
              style:kTextStyle20.copyWith(color: kPrimaryColor),
              ),
            const SizedBox(height: 8,),
             Text(CachHelper.phoneNumber!,
              style: kTextStyle20.copyWith(color: kPrimaryColor),),

            //Click here

             AddressView(event: event,),
            const  SizedBox(height: 16,),
             Text("تحديد وقت التوصيل",
              style: kTextStyle20.copyWith(color: kPrimaryColor)),
            const SizedBox(height: 8,),
              PickCalenderTime(event: event,),
            const  SizedBox(height: 25,),
            const Text("ملاحظات وتعليمات",  style: kTextStyle18),
            TextFormField(
              maxLines: 4,
              minLines: 4,

            ),
            const  SizedBox(height: 16,),

            const Text("اختر طريقة الدفع",style: kTextStyle18),
             PaymentView(),
            const Text("ملخص الطلب",  style: kTextStyle18),
            Container(
              color:const Color(0xffF3F8EE),
              height: 190.h,
              width: 400.w,
              child:BlocBuilder<ShowCartBloc,ShowCartStates>(
                bloc: bloc,
                buildWhen: (previous, current) =>current is ShowCartSuccessState,
                builder: (context, state) {
                  if (state is ShowCartSuccessState) {
                    return
                      Container(
                        decoration: BoxDecoration(
                            color: kPrimaryColor.withOpacity(0.1),

                            borderRadius: BorderRadius.all(Radius.circular(12.r))
                        ),
                        height: 300.h,
                        width: 440.w,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Row(children: [
                              const Text("إجمالي المنتجات", style: kTextStyle16),
                              const Spacer(),
                              Text(state.list.totalPriceBeforeDiscount.toString(),
                                  style: kTextStyle15normal)
                            ]), const Divider(
                              thickness: 0.15,
                            ),
                            Row(children: [
                              const Text(" الخصم", style: kTextStyle16),
                              const Spacer(),
                              Text(state.list.totalDiscount.toString(),
                                  style: kTextStyle15normal)
                            ]),
                            const Divider(
                              thickness: 0.15,
                            ),
                            Row(children: [
                              const Text("سعر التوصيل", style: kTextStyle16),
                              const Spacer(),
                              Text(
                                  state.list.deliveryCost.toString(),
                                style: kTextStyle15normal,
                              )
                            ]),
                            const Divider(
                              thickness: 0.15,
                            ),
                            Row(children: [
                              const Text("المجموع", style: kTextStyle16),
                              const Spacer(),
                              Text(state.list.totalPriceWithVat.toString(),
                                  style: kTextStyle15normal)
                            ]),

                          ]),
                        ),
                      );
                  }
                  return const SizedBox();
                }

            ),












            )
          ])
        ,
        ),
      ),
    );
  }
}
