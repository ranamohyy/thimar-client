import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/design/app_loading.dart';
import '../../../../../core/logic/helper_method.dart';
import '../../../../main/widgets/custom_app_bar.dart';
import '../../../data/get_wallet/bloc.dart';
import '../all_transaction/view.dart';
import '../recharge_now/view.dart';
class WalletView extends StatelessWidget {
   WalletView ({super.key});
  final wallet= GetIt.I<GetWalletBloc>()..add(GetWalletEvent());
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
    bloc: wallet,
      builder: (context, state) {
        if (state is GetWalletLoadingState) {
          return const AppLoadingView();
        }
        if (state is GetWalletSuccessState) {
          return Scaffold(
              extendBodyBehindAppBar: false,

              appBar:  CustomAppBar(
                  text: "wallet".tr(), ),
              body: CustomScrollView(
                slivers: [SliverToBoxAdapter(
                  child:      Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                     Center(
                      child: Text("balance".tr()
                          , style: kTextStyle24),
                    ),
                    const SizedBox(height: 12,),

                    Center(child: Text(state.list.wallet.toString()
                        ,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4C8613)
                        )
                    )),
                    const SizedBox(height: 25,),

                    DottedBorder(
                      color: kPrimaryColor,
                      dashPattern:const [5],
                      radius:const Radius.circular(15),
                      borderType: BorderType.RRect,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(

                            backgroundColor: const Color(0xffF9FCF5),


                          ),
                          onPressed: () {
                            navigateTo(RechargeView(id: state.list.data[0].id,));
                          }, child:  Text("chargeNow".tr(), style: kTextStyle20green)),
                    ),
                    const SizedBox(height: 60,),
                    Row(
                      children: [
                        const Text("سجل المعاملات", style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff4C8613)
                        )),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            navigateTo( const AllTransactionsView());
                          },
                          child:const Text("عرض الكل", style: kTextStyle15normal
                          ),
                        ),
                      ],
                    )]),
                  ),
                ),
                           SliverList(delegate: SliverChildBuilderDelegate(
                             childCount: state.list.data.length,
                             (context, index) =>
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
                   child: Container(
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15)
                           ,color: Colors.white,

                     ),
                     height: 90,
                     width: double.infinity,
                     child:
                     Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Row(
                             children: [
                               const AppImage(url: "arrowTop.png",
                                   width: 20,
                                   height: 20),
                               const SizedBox(width: 15,),

                               const Text("شحن المحفظة", style:
                               kTextStyle18
                               ),
                               const Spacer(),
                               Text(state.list.data[index].afterCharge.toString()
                                   , style:
                                   kTextStyle15light
                               )
                             ],
                           ),
                           const SizedBox(height: 10,),


                           Padding(
                             padding: const EdgeInsets.symmetric(horizontal: 50),
                             child: Text("${
                                        state.list.data[index].amount.toString()
                                      }ر.س",



                                 style: kTextStyle24
                             ),
                           ),
                         ])
                     ,
                   ),
                 ),


                           ),

                  // const SizedBox(height: 30,)
                           )   ,
                ]
              )
              );
        }return const  SizedBox();

    });


  }

}

