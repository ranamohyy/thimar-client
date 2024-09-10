part of 'finish_order_bloc.dart';

 class FinishOrderStates {}

final class FinishOrderInitial extends FinishOrderStates {}
class  FinishOrderLoading extends FinishOrderStates {}
class  FinishOrderSuccess extends FinishOrderStates {
  final String msg;
  FinishOrderSuccess({required this.msg});
}
class  FinishOrderFailure extends FinishOrderStates {
  final String errMessage;
  FinishOrderFailure({required this.errMessage});
}