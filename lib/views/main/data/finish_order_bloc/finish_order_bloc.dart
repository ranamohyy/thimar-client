
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/dio_helper.dart';

part 'finish_order_event.dart';
part 'finish_order_state.dart';

class FinishOrderBloc extends Bloc<FinishOrderEvents, FinishOrderStates> {
  FinishOrderBloc() : super(FinishOrderInitial()) {
    on<FinishOrderEvent>(_sendData) ;}
      Future<void> _sendData(FinishOrderEvent event,
          Emitter<FinishOrderStates>emit) async
      {
        emit(FinishOrderLoading());
        final response = await DioHelper.send("client/orders",
        data: {
          "address_id":event.addressId,
          'date':DateFormat('yyyy-MM-dd','en').format( event.picked) ,
          'time':'${event.selectTime.hour.toString().padLeft(2,'0')}:${event.selectTime.minute.toString().padLeft(2,'0')}',
          'pay_type':"wallet",
          'city_id':event.cityId

        }
        );
        if (response.isSuccess) {
          emit(FinishOrderSuccess(
            msg: response.data['message'],
          ));
        } else {
          emit(FinishOrderFailure(errMessage: response.data['message'])
          );
        }
      }
    }


