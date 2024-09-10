import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/constans.dart';
import 'package:thimar/core/design/app_image.dart';
import 'package:thimar/core/design/app_loading.dart';
import 'package:thimar/core/logic/helper_method.dart';
import 'package:thimar/views/main/data/get_fav_products_bloc/get_fav_products_bloc.dart';
import 'package:thimar/views/main/product_details/view.dart';

class FavoritePage extends StatefulWidget {
    FavoritePage({super.key,this.id });
  int? id;
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
final bloc= GetIt.I<GetFavProductsBloc>()..add(GeFavProductsEvent());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("المفضلة", style: TextStyle(
            fontSize: 20.sp,
            fontFamily: kTextFamily,
            fontWeight: FontWeight.bold,
            color:const  Color(0xff4C8613)
        ),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent.withBlue(2),
      ),
      body: SafeArea(
        child: BlocBuilder(
         bloc: bloc,
          builder: (context,state) {
           if(state is GeFavProductsSuccessState){
            return GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: state.list.length,
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 11.h,
                childAspectRatio: 160.w/220.h,

                mainAxisSpacing: 10.w,
              ),
              itemBuilder: (context, index) =>
                  GestureDetector(
                  onTap: (){ navigateTo(ProductDetailsView(
                      categoryId: state.list[index].categoryId,
                      isFav:  state.list[index].isFavorite,
                      desc: state.list[index].description,
                      discount: state.list[index].discount,
                      image: state.list[index].mainImage,
                      id: state.list[index].id,
                      afterDiscount: state.list[index].price,
                      title: state.list[index].price.toString(),
                      beforeDiscount: state.list[index].price));
                  },child:
              Card(
                color: Colors.white70,
                shadowColor: Colors.white70,
                elevation: 0,
                shape: RoundedRectangleBorder(borderRadius: BorderRadiusDirectional.circular(16.r)),
                child:Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Stack(
                        alignment: Alignment.topLeft,
                        children: [
                          AppImage(
                            borderRadius: BorderRadius.circular(12.r),
                            url:state.list[index].mainImage,
                            color: Colors.white12,
                            fit: BoxFit.fill,
                            width: 300.w,
                            height: 135.h,
                          ),
                          Container(
                            width: 50.w,
                            height: 20.h,
                            decoration: BoxDecoration(
                                color:const  Color(0xff61B80C),
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(12.r))),

                              child:Text("${(state.list[index].discount*100).toInt()} %",
                              textAlign: TextAlign.center,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,

                                      fontSize: 12.sp,
                                      fontFamily: kTextFamily))

                          )
                        ],),
                    const  SizedBox(height: 5,),
                      Text(state.list[index].title,
                        style: kTextStyle15,),
                      Text("السعر / 1 كجم",
                        style: TextStyle(
                            color:const Color(0xff757575),
                            fontFamily: kTextFamily,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w300),),
                      Row(

                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text( maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              "${state.list[index].price.toString()}ر.س",
                          style:
                          TextStyle(
                              color: const Color(0xff488011),
                              fontFamily: kTextFamily,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp)),
   const SizedBox(width: 4,),
                       Text(
                          "${state.list[index].priceBeforeDiscount.toString()}ر.س",
                              style:  TextStyle(
                                fontSize: 13.sp,

                                  decorationColor:kPrimaryColor ,
                                  decorationThickness: 2,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: kTextFamily,
                                  color: kPrimaryColor,
                                  decoration:
                                  TextDecoration.lineThrough)
                          ),
                          const   Spacer(),
                          GestureDetector(
                            onTap: (){ navigateTo(ProductDetailsView(
                                categoryId: state.list[index].categoryId,
                                isFav:  state.list[index].isFavorite,
                                desc: state.list[index].description,
                                discount: state.list[index].discount,
                                image: state.list[index].mainImage,
                                id: state.list[index].id,
                                afterDiscount: state.list[index].price,
                                title: state.list[index].price.toString(),
                                beforeDiscount: state.list[index].price));
                            },
                              child:
                              Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),
                                  color:const Color(0xff61B80C),),
                                child: const Icon(Icons.add,color: Colors.white,size: 20,),)
                          ),
                        ],
                      ),
                    ],),
                  ),
                ),
              )));}
           else if(state is GeFavProductsLoadingState){
             return const  AppLoadingView();
           }
           else if(
           state is GeFavProductsFailureState
           ){
             return const ScaffoldMessenger(child: Text('error'));
           }
           return const SizedBox();
          }
        ),
      ),


    );
  }
}
