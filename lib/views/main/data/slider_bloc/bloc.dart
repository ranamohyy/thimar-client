import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
part  'events.dart';
part 'states.dart';
part  'model.dart';

class SliderViewBloc extends Bloc<SliderEvents,SliderStates>{
SliderViewBloc(): super(SliderStates()){

on<LoadSliderEvent>(_getData);
}
Future <void> _getData (LoadSliderEvent event, Emitter<SliderStates> emit)async
{
  emit(SliderLoadingState());
  final response = await DioHelper.get("sliders");



  if (response.isSuccess){
    final list= List<SliderModel>.from((response.data?['data']??[]).map((e)=>
        SliderModel.fromJson(e)));

    emit(SliderSuccessState(
        msg:response.msg ,
        list:list

    ));
  }
  else {
    emit (SliderFailedState(
        errMessage: response.msg

    ));

  }
}
}