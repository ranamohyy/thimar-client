import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/dio_helper.dart';

part  'events.dart';
part 'states.dart';
part  'model.dart';
class SendContactUsBloc extends Bloc<SendContactUsEvents,SendContactUsStates> {
  SendContactUsBloc (): super(SendContactUsStates()){
    on<SendContactUsEvent>(_getData);

  }
  Future <void> _getData (SendContactUsEvent event, Emitter<SendContactUsStates> emit)async
  {

    emit (SendContactUsLoadingState());
    final response = await DioHelper.send("contact",data: {
      'fullname':event.nameController.text,
      'phone':event.phoneController.text,
      'title':"test",
      'content':event.contentController.text
    }
    );

    if (response.isSuccess){
      emit (SendContactUsSuccessState(

          msg: response.msg
      ));
    }
    else{
      emit(SendContactUsFailureState(errMessage: response.msg));
    }

  }




}