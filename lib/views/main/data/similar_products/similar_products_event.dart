part of 'similar_products_bloc.dart';
abstract class SimilarProductsEvents{}
 class SimilarProductsEvent extends SimilarProductsEvents{

 int ?categoryId;

  SimilarProductsEvent({  this.categoryId});

 }