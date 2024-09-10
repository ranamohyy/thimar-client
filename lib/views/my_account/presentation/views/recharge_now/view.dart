import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/views/main/widgets/custom_app_bar.dart';
import '../../../data/charge_wallet_bloc/charge_wallet_bloc.dart';
class RechargeView extends StatefulWidget {
    RechargeView({this.id,super.key});
num?id;
  @override
  State<RechargeView> createState() => _RechargeViewState();
}
class _RechargeViewState extends State<RechargeView> {
   final _form = GlobalKey<FormState>();
  final bloc =GetIt.I<WalletChargeBloc>();
 late final event= WalletChargeEvent( );
 @override
  void initState() {
   event.transactionId=widget.id!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(text: "chargeNow".tr(), ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
          child:Form(
              key: _form,
              child:  Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                const    SizedBox(height: 60,),
                   const Text("معلومات المبلغ",
                      style: kTextStyle18),
                    const SizedBox(height: 20,),
        
                    TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (value) {
                      if( value!.isEmpty){
                       return ('amount must ba valid');
                      }
                      return null;
                      },
                      controller:event.amount ,
                        decoration: InputDecoration(
                        hintText: "المبلغ الخاص بك",
        
                        hintStyle: kTextStyle15light,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:const BorderSide(color: Color(0xffDCDCDC),),
        
        
                        )
                    )),
                    const SizedBox(height: 22,),
                    const Text("معلومات البطاقة",    style:
                   kTextStyle18),
                    const SizedBox(height: 12,),
        
                    TextFormField(decoration: InputDecoration(
                        hintText: "الاسم",
                        hintStyle: kTextStyle15light,
                        border: OutlineInputBorder(
        
                          borderRadius: BorderRadius.circular(20),
                          borderSide:const BorderSide(color: Color(0xffDCDCDC),),
                        )
                    )),
                   const SizedBox(height: 12,),
                    TextFormField(
                        decoration: InputDecoration(
                        hintText: "رقم البطاقة الائتمانية",
        
                        hintStyle:kTextStyle15light,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Color(0xffDCDCDC),),
        
        
                        )
        
        
        
        
        
                    )),
                    const   SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        
                          children: [
                  SizedBox(
                width: 150,
                child:
                TextFormField(decoration: InputDecoration(
                  hintText: "تاريخ الانتهاء",
        
                  hintStyle: kTextStyle15light,
                  border: OutlineInputBorder(
        
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Color(0xffDCDCDC),),
        
        
                  )
        
        
        
        
        
                )),
                            ),
                     const SizedBox(width: 40,),
                       SizedBox(
                width: 150,
                child: TextFormField(decoration: InputDecoration(
                  hintText: "الرقم المتسلسل",
        
                  hintStyle: kTextStyle15light,
                  border: OutlineInputBorder(
        
                    borderRadius: BorderRadius.circular(20),
                    borderSide:const BorderSide(color: Color(0xffDCDCDC),),
        
        
                  )
        
        
        
        
        
                )),
                            ),
                        ],),
                    const SizedBox(height: 50,),
                    BlocConsumer<WalletChargeBloc,ChargeWalletStates>(
                      bloc: bloc,
                      listener: (context, state) {
                        if(state is WalletChargeLoadingState ){
                          const  AppLoadingView();
                        }  else if(state is WalletChargeSuccessState ){
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            backgroundColor: kPrimaryColor,
                              content: Text('تم تحويل المبلغ بنجاح',style:
                          kTextStyle14

                            ,)));
                        }
                      },
                      builder: (context, state) {
                        return ElevatedButton(onPressed: (){
                          final valid= _form.currentState!.validate();
                          if (valid){
                            bloc.add (event);
                          }
                        }, child: const Text("دفع",style: kTextStyle14,
                        ),
                        );
        
                                              }
                    )
        
                  ],
                ),
              ),
        
        ),
      ),



    );
  }
}
