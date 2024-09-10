part of 'send_item_cart_bloc.dart';

 class EditCartStates {}

 ///STOREITEM
final class SendItemCartInitial extends EditCartStates {}
final class SendItemCartSuccessState extends EditCartStates {
  final String msg;
  SendItemCartSuccessState({required this.msg});

}
final class SendItemCartFailureState extends EditCartStates{
  final String errMessage;
  SendItemCartFailureState({required this.errMessage});

}

///EDITAMOUNT
class PutAmountInitialState extends EditCartStates {}
class PutSuccessState extends EditCartStates {
  final String msg;
  PutSuccessState({required this.msg});
}
class PutFailureState extends EditCartStates {
  final String msg;
  PutFailureState({required this.msg});
}


///DELETEITEM
 class DeleteItemInitial extends EditCartStates {}
 class DeleteItemSuccess extends EditCartStates {
  final String msg;
  DeleteItemSuccess({required this.msg});
 }
 class DeleteItemFailure extends EditCartStates {
  final String msg;

  DeleteItemFailure({required this.msg});
 }