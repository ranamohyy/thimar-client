import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/core/app_failure/custom_error_widget.dart';
import '../../../../../../../../core/logic/helper_method.dart';
import '../../data/products_bloc/product_bloc.dart';
import '../../product_details/view.dart';
import '../../widgets/custom_products_loading.dart';
import '../../widgets/item_products_view.dart';
class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _GridViewTypesState();
}

class _GridViewTypesState extends State<ProductsView> {
final productBloc= GetIt.I<ProductBloc>()..add(ProductEvent());

  @override
  Widget build(BuildContext context) {
    return
      BlocBuilder(
        bloc: productBloc,
        builder: (context,state) {
          if (state is ProductSuccessState)
          {
            return
              GridView.builder(
                padding: EdgeInsetsDirectional.only(top: 12.h,start: 8.w,),
              itemCount: state.list.length,
              shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,mainAxisSpacing: 8,crossAxisSpacing: 8
                    ,   childAspectRatio:  2.899/3.53),
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>
                  Card(
                    elevation: 0,
                    color: Colors.white70,
                    shadowColor: Colors.white70,
                    child: GestureDetector(
                        onTap: () {
                          navigateTo(
                              ProductDetailsView(
                            categoryId: state.list[index].categoryId!,
                            isFav: state.list[index].isFavorite!,
                            id: state.list[index].id! ,
                            afterDiscount: state.list[index].priceBeforeDiscount,
                            desc: state.list[index].description,
                            discount: state.list[index].discount,
                            image: state.list[index].mainImage,
                            title: state.list[index].title,
                            beforeDiscount: state.list[index].price,
                          ));
                        },
                        child: ProductsItemBuilder(
                          imageUrl:state.list[index].mainImage ,
                          title: state.list[index].title,

                          beforeDisc:state.list[index].priceBeforeDiscount ,
                          percentDisc:state.list[index].discount ,
                          price:state.list[index].price ,
                          onPressed:() =>   navigateTo(
                              ProductDetailsView(
                                categoryId: state.list[index].categoryId!,
                            isFav: state.list[index].isFavorite! ,
                            id: state.list[index].id! ,
                            afterDiscount: state.list[index].priceBeforeDiscount,
                            desc: state.list[index].description,
                            discount: state.list[index].discount,
                            image: state.list[index].mainImage,
                            title: state.list[index].title,
                            beforeDiscount: state.list[index].price,
                          )),



                        ),
                      // const TypesItemBuilder(productModel: ProductModel(),),

                    ),
                  ),
            );
          }
          else if(state is ProductLoadingState) {
            return const CustomProductsLoading();
          }
            else if(state is ProductFailureState){
          return CustomErrorWidget(errMessage: state.errMessage);}
            return const SizedBox();
        }
      );

  }
}
