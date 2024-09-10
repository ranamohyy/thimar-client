part of 'bloc.dart';


class RateProductStates{}
class RateProductLoadingState extends RateProductStates{}

class RateProductSuccessState extends RateProductStates{
  final String msg;
  final List <RateProductModel> list;
  RateProductSuccessState({required this.msg, required this.list});
}

class RateProductFailureState extends RateProductStates{
  final String errMessage;
  RateProductFailureState({required this.errMessage});


}