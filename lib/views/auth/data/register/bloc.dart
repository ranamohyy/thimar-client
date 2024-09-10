import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
part  'events.dart';
part 'states.dart';
class RegisterBloc extends Bloc<RegisterEvents,RegisterStates>{
  RegisterBloc():super(RegisterStates()){
    on<RegisterEvent>(_sendData);
  }
  Future<void> _sendData (RegisterEvent event ,Emitter<RegisterStates> emit)async{
    emit(RegisterLoadingState());
    final response = await DioHelper.send("client_register",data:{
      "fullname": event.fullName,
      "phone": "${event.code}${event.phoneNumber}",
      "password":event.password,
      "password_confirmation":event.passwordConfirmation,
      "city": event.city,
      "gender":"female",
    });
    if(response.isSuccess){
     emit(RegisterSuccessState(msg: response.msg)) ;
    }
    else{
      emit(RegisterFailureState(errMessage: response.msg)
      );
    }
  }
}