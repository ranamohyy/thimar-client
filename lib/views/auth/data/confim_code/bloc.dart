import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';

import '../../../../core/logic/cache_helper.dart';

part  'events.dart';
part 'states.dart';
class ConfirmCodeBloc extends Bloc<ConfirmationCodeEvents,ConfirmCodeStates>{
  ConfirmCodeBloc():super(ConfirmCodeStates()){
    on<SendCodeEvent>(_sendData);
}


Future<void>_sendData (SendCodeEvent event,Emitter<ConfirmCodeStates>emit)async{
    
    emit(ConfirmCodeLoadingState());
    String token = await FirebaseMessaging.instance.getToken()??"test";
    final response =await DioHelper.send(
        event.type == 'register'? "verify":'check_code',
    data: {
      "phone":"${event.Code}${event.PhoneNumber}",
      "code":event.registerCode,
      "device_token": token,
        "type":Platform.operatingSystem,
    });    print(event.type);



    if(response.isSuccess){
   if(event.type == 'register')   {
        CachHelper.userId = response.data['data']['id'];
        CachHelper.image = response.data['data']['image'];
        CachHelper.token = response.data['data']['token'];
        CachHelper.phoneNumber = response.data['data']['phone'];
        CachHelper.userName = response.data['data']['fullname'];
        CachHelper.saveData();
      }
     emit(ConfirmCodeSuccessState(msg: response.msg));
    }
    else{
      emit (ConfirmCodeFailureState(errMessage: response.msg));
    }
    
}



}