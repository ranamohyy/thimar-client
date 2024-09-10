part of 'send_item_cart_bloc.dart';

 class EditCartEvent {}
class SendItemCartEvent extends  EditCartEvent{
    final int productId,amount;

  SendItemCartEvent({required this.productId, required this.amount});



}
class PutAmountEvent  extends EditCartEvent {

  final int id ;
  int?amount;

  PutAmountEvent({required this.id,  this.amount});

}
class DeleteItemEvent extends EditCartEvent  {
  final String id;


  DeleteItemEvent({required this.id});
}