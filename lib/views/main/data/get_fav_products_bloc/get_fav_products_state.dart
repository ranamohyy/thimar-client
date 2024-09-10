part of 'get_fav_products_bloc.dart';

 class GetFavProductsStates {}

 class GeFavProductsInitialState extends GetFavProductsStates {}
 class GeFavProductsLoadingState extends GetFavProductsStates {}
 class GeFavProductsSuccessState extends GetFavProductsStates {
  final String msg;
  final List<FavoriteProductModel> list;

  GeFavProductsSuccessState({required this.msg,required this.list});

}



class GeFavProductsFailureState extends GetFavProductsStates {
  final String errMessage;

  GeFavProductsFailureState({required this.errMessage});


       }

