part of 'product_bloc.dart';

abstract class ProductStates {}

 class ProductInitial extends ProductStates {}
class ProductLoadingState extends ProductStates{}

class ProductSuccessState extends ProductStates{
 final String msg;
 final List<ProductModel> list;

  ProductSuccessState({required this.msg,required this.list});

}

class ProductFailureState extends ProductStates{
 final String errMessage;

  ProductFailureState({required this.errMessage});


}
