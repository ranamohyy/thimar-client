part of 'action_button_bloc.dart';

 class ActionButtonStates {}
class ActionButtonStatesInitial extends ActionButtonStates{}
///cancelOrderStates
 class  CancelOrderLoading extends ActionButtonStates {}
 class  CancelOrderSuccess extends ActionButtonStates {
   final String msg;
   CancelOrderSuccess({required this.msg});
 }
 class  CancelOrderFailure extends ActionButtonStates {
   final String errMessage;
   CancelOrderFailure({required this.errMessage});
 }




///acceptStates
// class  AcceptButtonInitial extends ActionButtonStates {}
// class  AcceptButtonLoading extends ActionButtonStates {}
// class  AcceptButtonSuccess extends ActionButtonStates {
//   final String msg;
//   AcceptButtonSuccess({required this.msg});
//
// }
// class  AcceptButtonFailure extends ActionButtonStates {final String errMessage;
// AcceptButtonFailure({required this.errMessage});}
//


///startDelivering
// class  StartDeliverInitial extends ActionButtonStates {}
// class  StartDeliverLoading extends ActionButtonStates {}
// class  StartDeliverSuccess extends ActionButtonStates {
//   final String msg;
//   StartDeliverSuccess({required this.msg});
//
// }
// class  StartDeliverFailure extends ActionButtonStates {final String errMessage;
// StartDeliverFailure({required this.errMessage});}


///finishOrder
// class  FinishOrderInitial extends ActionButtonStates {}
// class  FinishOrderLoading extends ActionButtonStates {}
// class  FinishOrderSuccess extends ActionButtonStates {
//   final String msg;
//   FinishOrderSuccess({required this.msg});
//
// }
// class  FinishOrderFailure extends ActionButtonStates {final String errMessage;
// FinishOrderFailure({required this.errMessage});}
