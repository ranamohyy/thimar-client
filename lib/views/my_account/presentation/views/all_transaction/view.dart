import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/views/main/widgets/custom_app_bar.dart';
import '../../../../../../constans.dart';
import '../../../../../../core/design/app_image.dart';
import '../../../../../../core/design/app_loading.dart';
import '../../../data/get_wallet/bloc.dart';

class AllTransactionsView extends StatefulWidget {
  const AllTransactionsView ({super.key});

  @override
  State<AllTransactionsView> createState() => _AllTransactionsViewState();
}

class _AllTransactionsViewState extends State<AllTransactionsView> {
  final transBloc= GetIt.I<GetWalletBloc>()..add(GetWalletPaginatedEvent());
  @override
  Widget build(BuildContext context) {
     return BlocBuilder(
         bloc: transBloc,
         builder: (context, state) {
           if (state is GetWalletPaginatedLoading) {
             return const AppLoadingView();
           }
           else if (state is GetWalletPaginatedSuccess) {
             return
               Scaffold(
                   extendBodyBehindAppBar: false,
                   appBar:  CustomAppBar(
                       text: 'wallet'.tr(),),
                   body: SizedBox(
                       width: 400,
                       height: 600,
                       child: ListView.builder(
                           physics: const BouncingScrollPhysics(),
                           scrollDirection: Axis.vertical,
                           itemCount: state.list.data.length,
                           itemBuilder: (context, index) {
                              return Padding(
                                 padding: const EdgeInsets.symmetric(
                                     horizontal: 12.0, vertical: 8),
                                 child: Container(
                                   decoration: BoxDecoration(
                                     borderRadius: BorderRadius.circular(15)
                                     , color: Colors.white,

                                   ),
                                   height: 90,
                                   width: double.infinity,
                                   child:
                                   Column(
                                       crossAxisAlignment: CrossAxisAlignment
                                           .start,
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
                                             Text(state.list.data[index]
                                                 .afterCharge.toString()
                                                 , style:
                                                 kTextStyle15light
                                             )
                                           ],
                                         ),
                                         const SizedBox(height: 10,),


                                         Padding(
                                           padding: const EdgeInsets.symmetric(
                                               horizontal: 50),
                                           child: Text("${
                                               state.list.data[index].amount
                                                   .toString()
                                           }ر.س",


                                               style: kTextStyle24
                                           ),
                                         ),
                                       ])
                                   ,
                                 ),
                            );})
                   )
               );
           }
           return const SizedBox();
         }
         );







           }

            // Scaffold(
            //   extendBodyBehindAppBar: false,
            //   appBar: const CustomAppBar(
            //       text: ' المحفظة', tab: MyAccountPage()),
            //   body:
            //   CustomScrollView(
            //       slivers: [
            //         SliverList(
            //           delegate: SliverChildBuilderDelegate(
            //               childCount: state.list.data.length,
            //                   (context, index) {
            //
            //                 Padding(
            //                   padding: const EdgeInsets.symmetric(
            //                       horizontal: 12.0, vertical: 8),
            //                   child: Container(
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(15)
            //                       , color: Colors.white,
            //
            //                     ),
            //                     height: 90,
            //                     width: double.infinity,
            //                     child:
            //                     Column(
            //                         crossAxisAlignment: CrossAxisAlignment
            //                             .start,
            //                         children: [
            //                           Row(
            //                             children: [
            //                               const AppImage(url: "arrowTop.png",
            //                                   width: 20,
            //                                   height: 20),
            //                               const SizedBox(width: 15,),
            //
            //                               const Text("شحن المحفظة", style:
            //                               kTextStyle18
            //                               ),
            //                               const Spacer(),
            //                               Text(state.list.data[index]
            //                                   .afterCharge.toString()
            //                                   , style:
            //                                   kTextStyle15light
            //                               )
            //                             ],
            //                           ),
            //                           const SizedBox(height: 10,),
            //
            //
            //                           Padding(
            //                             padding: const EdgeInsets.symmetric(
            //                                 horizontal: 50),
            //                             child: Text("${
            //                                 state.list.data[index].amount
            //                                     .toString()
            //                             }ر.س",
            //
            //
            //                                 style: kTextStyle24
            //                             ),
            //                           ),
            //                         ])
            //                     ,
            //                   ),
            //                 );
            //
            //               }
            //
            //
            //           ),
            //
            //           // const SizedBox(height: 30,)
            //         ) ,
            //       ]
            //
            //   ));

         }













//      BlocBuilder(
//         bloc:transBloc,
//         builder:(context, state)
//         {
//           if (state is GetWalletPaginatedLoading) {
//             return const AppLoadingView();
//           }
//           if(state is GetWalletPaginatedSuccess) {
//         print('=========================${state.list.data.length}');
//         return Scaffold(
//             appBar: CustomAppBar(text: 'سجل المعاملات', tab: WalletView()),
//        body:  ListView.builder(
//
//             itemCount: state.list.data.length,
//             itemBuilder: (context, index) =>
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 8),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(15)
//                   ,color: Colors.white,
//
//                 ),
//                 height: 90,
//                 width: double.infinity,
//                 child:
//                 Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           const AppImage(url: "arrowTop.png",
//                               width: 20,
//                               height: 20),
//                           const  SizedBox(width: 15,),
//                           const Text("شحن المحفظة", style:
//                           kTextStyle18
//                           ),
//                           const Spacer(),
//                           Text(state.list.data[index].afterCharge.toString()
//                               , style:
//                               kTextStyle15light
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 10,),
//
//
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 50),
//                         child: Text("${
//                             state.list.data[index].amount.toString()
//                         }ر.س",
//
//
//                             style: kTextStyle24
//                         ),
//                       ),
//                     ])
//                 ,
//               ),
//             ),
//        ));
//     //   CustomScrollView(
//     // slivers: [
//     // SliverList(
//     //   delegate: SliverChildBuilderDelegate(
//     // childCount: state.list.data.length,
//     // (context, index) =>
//     //
//     //
//     // ),
//     //
//     // // const SizedBox(height: 30,)
//     // ) ,
//     // ]
//     //
//     // );
//
//
//     }
//
// return const Text('kkkkkkkkkkkkkkkkkkkkkkk');
//         }
//     );