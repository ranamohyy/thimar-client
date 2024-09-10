part of 'bloc.dart';
 class CatogriesStates{}

 class CatogriesState extends CatogriesStates{}


   class CatogriesLoadingState extends CatogriesStates {}


   class CatogriesSuccessState extends CatogriesStates {

     final String msg;
     final  List<CategoryModel> list;

  CatogriesSuccessState({required this.msg, required this.list});

   }


   class CatogriesFailureState extends CatogriesStates {

  final String errMessage;

  CatogriesFailureState({required this.errMessage});

   }


