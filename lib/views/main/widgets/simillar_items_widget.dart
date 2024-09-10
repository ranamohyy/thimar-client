import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/core/logic/helper_method.dart';
import 'package:thimar/views/main/data/similar_products/similar_products_bloc.dart';
import 'package:thimar/views/main/product_details/view.dart';
import '../../../constans.dart';
import '../../../core/design/app_image.dart';
import 'item_products_view.dart';
class SimilarItemsWidget extends StatefulWidget {
  const SimilarItemsWidget({super.key, required this.categoryId});
  final int categoryId;

  @override
  State<SimilarItemsWidget> createState() => _SimilarItemsWidgetState();
}

class _SimilarItemsWidgetState extends State<SimilarItemsWidget> {
   final bloc = GetIt.I<SimilarProductsBloc>();

  @override
  void initState() {
    bloc.add(SimilarProductsEvent( categoryId: widget.categoryId));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarProductsBloc,SimilarProductsStates>(
      bloc: bloc,
        builder:(context, state) {
          if(state is SimilarProductsLoading){
            return const AppLoadingView();
          }
          else if(state is SimilarProductsSuccessState){
            return
              GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,mainAxisSpacing: 8,
                childAspectRatio: 2.6/3
              ),
                        physics:const  BouncingScrollPhysics(),
                        itemCount: state.list.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder:(context, index) =>
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment:CrossAxisAlignment.start ,
                                children: [
                                SizedBox(
                                height: 80.h,width: 120.w,
                                child: Stack(
                                  alignment: Alignment.topLeft,
                                  children: [
                                    AppImage(url:state.list[index].mainImage,height: 80.h,width: 120.w,fit: BoxFit.fill, ),

                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.r)),
                                          color:const  Color(0xff61B80C)
                                      ),
                                      height: 20.h,
                                      width: 40.w,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        "${(state.list[index].discount *100).toInt()} %"
                                        ,  style:  TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontFamily: kTextFamily,


                                      ),
                                      ),
                                    ),

                                  ],),),
                                                 Column(      mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment:CrossAxisAlignment.start ,

                                                  children: [
                                                    Text(state.list[index].title,
                                                      style:
                                                      kTextStyle18,),
                                                    const    SizedBox(height: 2,),
                                                    const Text("السعر / 1 كجم",
                                                        style:kTextStyle15light),
                                                    const SizedBox(height: 3,),
                                                    Row(
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: [
                                                        Text("${state.list[index].price.toString()}ر.س",
                                style: TextStyle(
                                    color:const Color(0xff488011),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp)),

                                                        Text("${state.list[index].priceBeforeDiscount.toString()}ر.س",
                                style: TextStyle(
                                    color:kPrimaryColor,
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12.sp,
                                    decoration: TextDecoration.lineThrough) ),
                                                        SizedBox(width: 2.w,),

                                                        GestureDetector(
                              onTap:(){ navigateTo(
                                  ProductDetailsView(
                                      categoryId: state.list[index].categoryId,
                                      desc: state.list[index].description,
                                      discount:state.list[index].discount  ,
                                      image:state.list[index].mainImage ,
                                      id:  state.list[index].id,
                                      afterDiscount:  state.list[index].price,
                                      title:state.list[index].title  ,
                                      beforeDiscount:state.list[index].price  ,
                                      isFav:  state.list[index].isFavorite
                                  )
                              );},
                              child: Container(
                                width: 20.w,
                                height: 25.h,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                                  color:const Color(0xff61B80C),),
                                child:  Icon(Icons.add,color: Colors.white,size: 25.r,),),
                                                        ),


                                                      ],
                                                    ),
                                                  ],)
                                                        ]  )
                            ) );
          }

         return  Container(
            color: Colors.red,
          );
        } );


        }
}

