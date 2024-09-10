import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import '../../../../../constans.dart';
import '../../../../../core/design/app_loading.dart';
import '../../../../../core/logic/helper_method.dart';
import '../../data/my_orders_bloc/orders_bloc.dart';
import '../../order_details/view.dart';
import '../../widgets/custom_order_builder.dart';
class MyOrdersView extends StatefulWidget {
  const   MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  final currentData= GetIt.I<OrdersBloc>()..add(OrderCurrentEvent());
  final finishData= GetIt.I<OrdersBloc>()..add(OrderEndingEvent());
  TabController? controller;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading: const SizedBox(),
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text("ordersNow".tr(), style: kTextStyle20green),
              centerTitle: true,
              bottom: TabBar(

                  unselectedLabelColor:const Color(0xffA2A1A4),
                  indicator:  BoxDecoration(color: kPrimaryColor ,
                      borderRadius: BorderRadius.all(Radius.circular(16.r))
                  ),
                  automaticIndicatorColorAdjustment: true,
                  indicatorColor: kPrimaryColor,

                  labelColor: Colors.white,
                  tabs
                      : [
                    Tab(child:
                    SizedBox(

                      width: 180.w,
                      child:
                       Center(child: Text("currentOrders".tr(),style:const  TextStyle(
                          fontFamily: kTextFamily
                      ),
                      ) ,) ,),),
                     Tab(child:
                    SizedBox(

                      width: 180,
                      child:
                      Center(child: Text('finishedOrders'.tr()
                        ,style: const  TextStyle(
                            fontFamily: kTextFamily
                        ),)
                        ,),),)
                    ,]),
            ),
            body:

            SafeArea(
                child:
                TabBarView(
                   controller: controller,
                    children: [
                      BlocBuilder<OrdersBloc,OrdersStates>(
                          bloc: currentData,
                          buildWhen: (previous, current) => current is OrderCurrentLoading||current is OrderCurrentSuccess ||current is OrderCurrentFailure,
                          builder: (context, state) {
                            if (state is OrderCurrentLoading) {
                              return const AppLoadingView();
                            } else if (state is OrderCurrentSuccess) {
                              if (state.model.isEmpty) {
                                return Center(
                                    child: Image.network(
                                        "https://img.freepik.com/free-vector/hand-drawn-no-data-concept_52683-127823.jpg?w=900&t=st=1725622423~exp=1725623023~hmac=646e5e6039928294509922e9c8f688e49128875c02f2c93460bd590afb643abd"
                                    )
                                );
                              } else {
                                return ListView.builder(
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                        onTap: () {
                                          navigateTo(OrderDetailsView(type: "الحالية",id: state.model[index].id,
                                            location: state.model[index].location ,
                                            clientName: state.model[index].clientName,
                                            date: DateTime.parse("${state.model[index].date}"),
                                            price: state.model[index].totalPrice.toString(),
                                            statusNumber:state.model[index].status,
                                            deliveryPrice:state.model[index].deliveryPrice.toString() ,
                                            orderPrice:state.model[index].orderPrice.toString() ,
                                            payType:state.model[index].payType ,
                                            totalPrice:state.model[index].totalPrice.toString() ,
                                          ) );
                                        },

                                        child: Card(
                                          color: Colors.white,
                                          elevation:0.2,


                                          child: Padding(
                                            padding:  EdgeInsets.only(left: 12.w,right: 12.w,bottom: 20.h,top: 5.h),
                                            child: ItemBuilderForOrder(
                                              clientName: state.model[index].clientName,
                                              date: DateTime.parse("${state.model[index].date}"),
                                              price: state.model[index].totalPrice.toString(),
                                              orderNumber:state.model[index].id,
                                              statusOrder:state.model[index].status,

                                            ),
                                          ),
                                        ),),
                                  itemCount: state.model.length,
                                  padding:  EdgeInsets.only(left: 12.w,right: 12.w,bottom: 10.h,top: 5.h),

                                );
                              }
                            }
                            return const SizedBox();
                          }
                      ),

                      BlocBuilder<OrdersBloc,OrdersStates>(
                          bloc: finishData,
                          buildWhen: (previous, current) => current is OrderEndingLoading||current is OrderEndingSuccess ||current is OrderEndingLoading,
                          builder: (context, state) {
                            if (state is OrderEndingLoading) {
                              return const AppLoadingView();
                            } else if (state is OrderEndingSuccess) {
                              if (state.model.isEmpty) {
                                return Center(
                                    child: Image.network(
                                        "https://img.freepik.com/free-vector/hand-drawn-no-data-concept_52683-127823.jpg?w=900&t=st=1725622423~exp=1725623023~hmac=646e5e6039928294509922e9c8f688e49128875c02f2c93460bd590afb643abd"
                                    ) );
                              } else {
                                return ListView.builder(
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                        onTap: () {
                                          navigateTo(OrderDetailsView(type: "المنتهية",id: state.model[index].id,
                                            location: state.model[index].location ,
                                            clientName: state.model[index].clientName,
                                            date: DateTime.parse("${state.model[index].date}"),
                                            price: state.model[index].totalPrice.toString(),
                                            statusNumber:state.model[index].status,
                                            deliveryPrice:state.model[index].deliveryPrice.toString() ,
                                            orderPrice:state.model[index].orderPrice.toString() ,
                                            payType:state.model[index].payType ,
                                            totalPrice:state.model[index].totalPrice.toString() ,
                                          ));
                                        },
                                        child: Padding(
                                          padding:EdgeInsets.only(left: 12.w,right: 12.w,bottom: 20.h,top: 5.h),
                                          child: Card(
                                            color: Colors.white,
                                            elevation:0.2,
                                            child: ItemBuilderForOrder(
                                              clientName: state.model[index].clientName,
                                              date: DateTime.parse("${state.model[index].date}"),
                                              price: state.model[index].totalPrice.toString(),
                                              orderNumber:state.model[index].id,
                                              statusOrder:state.model[index].status,

                                            ),
                                          ),
                                        ),),
                                  itemCount: state.model.length,
                                  padding:  EdgeInsets.only(left: 12.w,right: 12.w,bottom: 15.h,top: 5.h)

                                );
                              }
                            }
                            return const SizedBox();
                          }
                      ),
                    ])
            )
        )
    );
  }
}
