
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/dio_helper.dart';

part 'action_button_event.dart';
part 'action_button_state.dart';

class ActionButtonBloc extends Bloc<ActionButtonEvents, ActionButtonStates> {
  ActionButtonBloc() : super(ActionButtonStatesInitial()) {
    on<CancelOrderEvent>(_sendData) ;
    // on<AcceptOrderEvent>(_getAcceptData) ;
    // on<StartDeliverEvent>(_getDeliverData) ;
    // on<FinishOrderEvent>(_getFinishOrderData) ;
  }
  ///cancelOrder
  Future<void>_sendData(CancelOrderEvent event,Emitter<ActionButtonStates>emit)async
  {
    emit(CancelOrderLoading());
    final response = await DioHelper.send("client/orders/${event.id}/cancel");
    if (response.isSuccess){

      emit(CancelOrderSuccess(
        msg:response.msg,
      ));

    }else {
     emit (CancelOrderFailure(errMessage: response.msg)
      );
    }
  }



  // Future<void> _getAcceptData(AcceptOrderEvent event,Emitter<ActionButtonStates>emit)async
  // {
  //   emit(AcceptButtonLoading());
  //   final response = await DioHelper.get("driver/accept_order/${event.id}");
  //   if (response.isSuccess){
  //
  //     emit(AcceptButtonSuccess(
  //       msg:response.msg,
  //     ));
  //
  //   }else {
  //    emit (AcceptButtonFailure(errMessage: response.msg)
  //     );
  //   }
  // }
  //
  // Future<void> _getDeliverData(StartDeliverEvent event,Emitter<ActionButtonStates>emit)async
  // {
  //   emit(StartDeliverLoading());
  //   final response = await DioHelper.get("driver/start_delivering_order/${event.id}");
  //   if (response.isSuccess){
  //     emit(StartDeliverSuccess(
  //       msg:response.msg,
  //     ));
  //   }else {
  //    emit (StartDeliverFailure(errMessage: response.msg)
  //     );
  //   }
  // }
  //
  // Future<void> _getFinishOrderData(FinishOrderEvent event,Emitter<ActionButtonStates>emit)async
  // {
  //   emit(FinishOrderLoading());
  //   final response = await DioHelper.get("driver/finish_order/${event.id}",parameter:{
  //     "client_paid_amount":event.amount
  //   }
  //     );
  //   if (response.isSuccess){
  //     emit(FinishOrderSuccess(
  //       msg:response.msg,
  //     ));
  //   }else {
  //    emit (FinishOrderFailure(errMessage: response.msg)
  //     );
  //   }
  // }

}
