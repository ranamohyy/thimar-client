part of 'similar_products_bloc.dart';

 class SimilarProductsStates{}

final class SimilarProductsLoading extends SimilarProductsStates {}

final class SimilarProductsSuccessState extends SimilarProductsStates {
  final String msg;
  final List<SimilarProducts>list;
  SimilarProductsSuccessState({required this.msg,required this.list,});

}
final class SimilarProductsFailureState extends SimilarProductsStates{
  final String errMessage;
  SimilarProductsFailureState({required this.errMessage});

}
