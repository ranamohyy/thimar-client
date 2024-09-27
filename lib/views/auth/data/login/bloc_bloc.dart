
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import '../../../../core/logic/cache_helper.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';
bool isSuccess= true;
class LogInBloc extends Bloc<LogInEvents, LogInStates> {
  LogInBloc() : super(LogInStates()) {
    on<LogInEvent>(_sendData);
  }
    Future<void> _sendData(LogInEvent event, Emitter<LogInStates>emit ,) async{
    emit(LogInLoadingState());
   String token = await FirebaseMessaging.instance.getToken()??"test";
    final response = await DioHelper.send('login',data:{
    'phone': "${event.code}${event.phone}",
    'password' : event.password,
    "user_type":"client",
    "device_token": token,
    "type":Platform.operatingSystem,
      'city_name':event.city
    });

    if(response.isSuccess){
    CachHelper.userId = response.data['data']['id'];
    CachHelper.image= response.data['data']['image'];
    CachHelper.token= response.data['data']['token'];
    CachHelper.phoneNumber= response.data['data']['phone'];
    CachHelper.userName= response.data['data']['fullname'];

    CachHelper.saveData();
    emit(LogInSucessState(msg: response.msg));}
    else {
      emit (LogInFailedState(msg:response.msg));
    }

  }



}
