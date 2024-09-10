
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import '../../../../models/rate_product_model.dart';

part  'events.dart';
part 'states.dart';


class RateProductBloc extends Bloc<RateProductEvents,RateProductStates>{
  RateProductBloc():super(RateProductStates()){
  on<RateProductEvent>(_getData);
  }
  
  
  Future<void>_getData(RateProductEvent event,Emitter<RateProductStates>emit)async{
    emit(RateProductLoadingState());
    final response = await DioHelper.get('products/${event.id}/rates');
    if(response.isSuccess){
      final list= List<RateProductModel>.from((response.data?['data']??[]).map((e)=>RateProductModel.fromJson(e)));
       emit(RateProductSuccessState(
        msg: response.msg,
        list: list,
      ));
    }else {
      emit(RateProductFailureState(errMessage: response.msg));
    }
  }
}