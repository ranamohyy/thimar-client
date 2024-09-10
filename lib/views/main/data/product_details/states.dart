part of 'bloc.dart';
class ProductDetailsStates{}

class ProductDetailsState extends ProductDetailsStates{}


class ProductDetailsLoadingState extends ProductDetailsStates {}


class ProductDetailsSuccessState extends ProductDetailsStates {

  final String msg;
  final List <ProductModel> list;

  ProductDetailsSuccessState({required this.msg, required this.list});

}


class ProductDetailsFailureState extends ProductDetailsStates {

  final String errMessage;

  ProductDetailsFailureState({required this.errMessage});

}