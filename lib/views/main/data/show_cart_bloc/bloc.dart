import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';


part  'events.dart';
part 'states.dart';
part  'model.dart';

class ShowCartBloc extends Bloc<ShowCartEvents,ShowCartStates>{
  ShowCartBloc():super(ShowCartStates()){
    on<ShowCartEvent>(_getData);
  }

  Future<void>_getData (ShowCartEvent event,Emitter<ShowCartStates>emit)async{
    emit(ShowCartLoadingState());
  final response= await DioHelper.get('client/cart');


    if(response.isSuccess){
      final list = CartModel.fromJson(response.data??{});
      emit(ShowCartSuccessState(
        msg: response.msg,
        list: list));
  }
  else{
    emit(ShowCartFailureState(errMessage: response.msg));
  }

    
  }}







