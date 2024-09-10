import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';


part 'send_item_cart_event.dart';
part 'send_item_cart_state.dart';

class EditCartBloc extends Bloc<EditCartEvent, EditCartStates> {
  EditCartBloc() : super(SendItemCartInitial()) {
    on<SendItemCartEvent>(_sendData);
    on<PutAmountEvent>(_putData);
    on<DeleteItemEvent>(_deleteData);
  }

  Future<void>_sendData (SendItemCartEvent event, Emitter<EditCartStates>emit)async{
    emit(SendItemCartInitial());
    final response = await DioHelper.send('client/cart',
    data: {
      'product_id':event.productId,
      'amount':event.amount
    }


    );

    if(response.isSuccess){
      emit(SendItemCartSuccessState(msg: response.data['message']));
    }else{

      emit(SendItemCartFailureState(errMessage: response.msg));
    }




  }
  Future<void> _putData(PutAmountEvent event, Emitter<EditCartStates>emit) async {
    emit(PutAmountInitialState());
    final response = await DioHelper.put(
        "client/cart/${event.id}", data: {
      'amount':
      event.amount
    });
    if (response.isSuccess) {
      emit(PutSuccessState(msg: response.msg

      ));
    }
    else {
      emit(PutFailureState(msg: response.msg));
    }
  }}
  Future<void>_deleteData (DeleteItemEvent event, Emitter<EditCartStates>emit)async{

  final response =await DioHelper.delete("client/cart/delete_item/${event.id}");
  if(response.isSuccess){
    emit(DeleteItemSuccess(msg: response.msg));
  }else{
    emit(DeleteItemFailure(
        msg: response.msg
    ));
  }
}

