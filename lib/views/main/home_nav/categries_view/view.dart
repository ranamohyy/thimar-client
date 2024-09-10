import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:thimar/core/app_failure/custom_error_widget.dart';
import '../../../../../../../../core/logic/helper_method.dart';
import '../../category_products/view.dart';
import '../../data/categories_bloc/bloc.dart';
import '../../widgets/custom_categries_loading.dart';
import '../../widgets/item_categry_builder.dart';

class ListFeatchCatogries extends StatelessWidget {
   ListFeatchCatogries({super.key});
  final catogrybloc = GetIt.I<CatogryBloc>()..add(LoadCatogriesEvent());


   @override
  Widget build(BuildContext context) {
    return
      BlocBuilder(
        bloc:catogrybloc ,
        builder: (context,state) {
          if (state is CatogriesSuccessState) {
            return
              SizedBox(
              height: 170.h,
              width: MediaQuery.of(context).size.width,
              child: ListView.separated(
                physics: const BouncingScrollPhysics()
                ,
                  itemCount: state.list.length,
                  scrollDirection: Axis.horizontal,
                   separatorBuilder: (context, index) =>  Padding(padding: EdgeInsets.symmetric(horizontal: 32.w)),
                itemBuilder:  (context, index) {
                  return GestureDetector(
                    onTap: () {
                      navigateTo(const CategoryProductsView());
                    },
                    child:
                     ItemCatogryBuilder(
                       imageUrl: state.list[index].media,
                       text:state.list[index].name
                     ),
                  );
                }
                ),


            );
          }else if (state is CatogriesLoadingState){
            return const  CustomCategriesLoading();
          }else if(state is CatogriesFailureState){
            return  CustomErrorWidget(errMessage: state.errMessage);
          }
          return const SizedBox();
        }
      );
  }
}
