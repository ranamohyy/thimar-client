
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/dio_helper.dart';

part 'charge_wallet_event.dart';
part 'charge_wallet_state.dart';

class WalletChargeBloc extends Bloc<ChargeWalletEvents, ChargeWalletStates> {
  WalletChargeBloc() : super(ChargeWalletInitial()) {
    on<WalletChargeEvent>(_sendData) ;}
  Future<void> _sendData(WalletChargeEvent event, Emitter<ChargeWalletStates> emit) async{
    emit(WalletChargeLoadingState());
    final response = await DioHelper.send("wallet/charge",data: {
     "amount":event.amount.text,
      "transaction_id":event.transactionId
    });

    if(response.isSuccess){
      emit(WalletChargeSuccessState(
          msg: response.msg
      ));
    }else{
      emit(ChargeWalletFailure(errMessage: response.msg
      ));
    }
  }



}

