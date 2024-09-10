import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
part 'resend_code_event.dart';
part 'resend_code_state.dart';
class ResendCodeBloc extends Bloc<ResendCodeEvents, ResendCodeStates> {
  ResendCodeBloc() : super(ResendCodeStates()) {
    on<ResendCodeEvent>(_sendData);
  }

  Future<void>_sendData(ResendCodeEvent event,Emitter<ResendCodeStates>emit)async{
    emit(ResendCodeLoadingState());
    final response =await DioHelper.send(
        event.type=='register'? "resend_code" :'forget_password',
        data:{
      "phone":"${event.Code}${event.phoneNumber}",


    } );
    if(response.isSuccess){
      emit(ResendCodeSuccessState(msg: response.msg)) ;
    }
    else{
      emit(ResendCodeFailureState(errMessage: response.msg)
      );
    }



  }
}
