import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/app_failure/custom_error_widget.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/views/main/widgets/custom_app_bar.dart';
import 'package:thimar/views/main/complete_order/view.dart';
import 'package:thimar/views/main/data/show_cart_bloc/bloc.dart';
import '../../../core/design/app_image.dart';
import '../../../core/logic/helper_method.dart';
import '../data/get_cart_bloc/send_item_cart_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key,});
  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  late final bloc = GetIt.I<ShowCartBloc>()..add(ShowCartEvent());
  final editBloc=GetIt.I<EditCartBloc>();
  // final List<ProductCartModel>cartItems=[];
  // void removeItem(int id){
  //   setState(() {
  //     cartItems.removeWhere((item)=>item.id==id);
  //   });
  // }
  @override
  void initState() {
    GetIt.I.resetLazySingleton<ShowCartBloc>();
    super.initState();
  }
  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowCartBloc,ShowCartStates>(
      bloc: bloc,
      builder: (context,state) {
        if (state is ShowCartSuccessState){
          if(state.list.data.isEmpty){
            Center(
                child: Image.network(
                    "https://img.freepik.com/free-vector/hand-drawn-no-data-concept_52683-127823.jpg?w=900&t=st=1725622423~exp=1725623023~hmac=646e5e6039928294509922e9c8f688e49128875c02f2c93460bd590afb643abd"
                ) );
                }
          else{
        return Scaffold(
            extendBodyBehindAppBar: false,
            appBar:  CustomAppBar(text: 'cart'.tr() ),
           bottomNavigationBar: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                children: [
                      Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          TextFormField(

                            decoration:const InputDecoration(
                              label: Text("عندك كوبون ؟ ادخل رقم الكوبون"),
                            ),
                          ),
                          SizedBox(
                              width: 100,
                              height: 50,
                              child: ElevatedButton (
                                onPressed : () {
                                },
                                child:const Text("تطبيق",
                                style: kTextStyle14,
                                ),
                              )),
                        ],
                      ),
                  SizedBox(height: 6.h,),

                  Text("   جميع الأسعار تشمل قيمة الضريبة المضافة 15% ",
                    style: TextStyle(
                   fontFamily: kTextFamily,fontSize: 14.sp,


                 ),),
                   SizedBox(height: 6.h,),
                 Padding(
                   padding:  EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
                   child: Column(children: [
                      Container(
                        color:const Color(0xffF3F8EE),
                        height: 120.h,
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                            Row(
                                children: [
                                  const Text("إجمالي المنتجات",
                                    style: TextStyle(
                                        fontFamily: kTextFamily,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w200),
                                  ),
                                  const Spacer(),
                                  Text(state.list.totalPriceBeforeDiscount.toString(),
                                    style:kTextStyle15black,)
                                ]),

                            Row(
                                children: [
                                  const Text("إجمالي الخصم",
                                    style: kTextStyle15black,),
                                  const Spacer(),
                                  Text(
                                   " ${state.list.totalDiscount.floor().toString()}%",
                                    style: kTextStyle15black)
                                ]), Row(
                                children: [
                                  const Text("المجموع",
                                    style: kTextStyle15black),
                                  const Spacer(),
                                  Text(state.list.totalPriceWithVat.toString(),
                                    style:kTextStyle15black)
                                ]),


                          ]),
                        ),

                      ),
                     const  SizedBox(height: 12,),
                      ElevatedButton(onPressed: (){
                        navigateTo(const CompleteOrderView());
                      },
                        style: ElevatedButton.styleFrom(shape:RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(16)) ),

                        child:const Text("الانتقال لإتمام الطلب",style: kTextStyle14,),

                      )

                    ]),
                 )]),
           ),
        body:
         SizedBox(
          width: 400,
          height: 600,
          child: ListView.builder(
          physics:const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: state.list.data.length,
          itemBuilder:(context, index) {
            // final item = cartItems[index];
           return Column(children: [
             Container(
               padding:const EdgeInsetsDirectional.only(top: 10, bottom: 12),
               decoration: BoxDecoration(
                 borderRadius: BorderRadiusDirectional.circular(16),
               ),
               width: 400,
               child: Row(
                   children: [
                     AppImage(
                         url:state.list.data[index].image
                         , height: 90,
                         width:100),
                     Column(
                       children: [
                         Text(
                             state.list.data[index].title,
                             style:kTextStyle16),
                         Text("${state.list.data[index].price.toString()} ر.س",
                             style:kTextStyle15),
                         Stack(
                           alignment: Alignment.center,
                           children: [
                              Container(
                                height: 30.h,
                               width: 80.w,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.all(Radius.circular(8.r)),
                                 color: kPrimaryColor.withOpacity(0.1)
                               ),
                             ),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   ///increaseAmount
                                   GestureDetector(
                                     onTap:(){
                                       state.list.data[index].amount++;

                                       // state.list.data[index].amount++;
                                       editBloc.add(PutAmountEvent(id:state.list.data[index].id,
                                           amount:state.list.data[index].amount)
                                       );

                                       setState(() {
                                       });
                                     },

                                     child: const Icon(Icons.add,color: kPrimaryColor,size: 18,),
                                   ),
                                   SizedBox(width: 4.w,),
                                   Text(state.list.data[index].amount.toString(),style: kTextStyle16,),
                                   SizedBox(width: 6.w,),

                                   ///decreaseAmount
                                   GestureDetector(
                                       onTap: () {
                                         if(state.list.data[index].amount
                                             <0){
                                           state.list.data[index].amount++;
                                         }
                                         setState(() {
                                           state.list.data[index].amount--;
                                           editBloc.add(PutAmountEvent(id:state.list.data[index].id, amount:state.list.data[index].amount));                            },);

                                         },

                                       child:const  Icon(FontAwesomeIcons.minus,color: kPrimaryColor,size: 17,)
                                   ),
                                 ]),
                           ],
                         )
                       ],
                     ),
                     SizedBox(
                       width: 110.w,
                     ),
                     GestureDetector(
                         onTap: () {
                           editBloc.add(DeleteItemEvent(id: state.list.data[index].id.toString()));
                           bloc.add(ShowCartEvent());
                          // removeItem(state.list.data[index].id);
                         },
                         child:const AppImage(
                           url:"delete_icon.png",
                           height: 30,
                           width: 30,
                         ))
                   ]),
             ), ]);}


          )
         )
        );}
        }
        else if (state is ShowCartLoadingState){
          return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width ,
              color: Colors.white,
              child: const AppLoadingView());}
        else if (state is ShowCartFailureState) {
                    return CustomErrorWidget(errMessage: state.errMessage);
        }
        return const  SizedBox();});


  }

  }
