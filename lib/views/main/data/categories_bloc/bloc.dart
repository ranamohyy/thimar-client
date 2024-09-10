import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';

import 'catogry_model.dart';

part  'events.dart';
part 'states.dart';

class CatogryBloc extends Bloc<LoadCatogriesEvents,CatogriesStates>{
  CatogryBloc():super(CatogriesStates()){
    on<LoadCatogriesEvent>(_getData);
  }

  Future<void>_getData (LoadCatogriesEvent event,Emitter<CatogriesStates>emit)async

  {
    emit(CatogriesLoadingState());
    final response = await DioHelper.get("categories");

    if (response.isSuccess){
      final list = List<CategoryModel>.from((response.data?['data']??[]).map((e)=>CategoryModel.fromJson(e)));

      emit(CatogriesSuccessState(
          msg: response.msg
      , list:list

      ));

    }else {
      emit( CatogriesFailureState(
        errMessage: response.msg

      ));
    }




  }

}