import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/views/main/data/show_cart_bloc/bloc.dart';
import 'package:thimar/models/privacy_model.dart';

part 'privacy_event.dart';
part 'privacy_state.dart';

class PrivacyBloc extends Bloc<PrivacyEvents, PrivacyStates> {
  PrivacyBloc() : super(PrivacyInitial()) {
    on<PrivacyEvent>(_getData) ;
  }

  Future<void>_getData(PrivacyEvent event,Emitter<PrivacyStates>emit)async{
    emit(PrivacyLoading());
   final response=  await DioHelper.get('policy');
   if(response.isSuccess){
     final list =  PrivacyModel.fromJson(response.data ?? {});
     emit(PrivacySuccess(
         msg: response.msg,list:list
     ));
   }else {
     emit(PrivacyFailure(msg: response.msg));
   }
  }



}
