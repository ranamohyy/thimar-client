import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/logic/dio_helper.dart';
import 'TermsModel.dart';

part 'terms_event.dart';
part 'terms_state.dart';

class TermsBloc extends Bloc<TermsEvents, TermsStates> {
  TermsBloc() : super(TermsInitial()) {
    on<TermsEvent>(_getData) ;
    }
  Future<void>_getData(TermsEvent event,Emitter<TermsStates>emit)async{
    emit(TermsLoading());
    final response=  await DioHelper.get('terms');
    if(response.isSuccess){
      final list =  TermsModel.fromJson(response.data ?? {});
      emit(TermsSuccess(
          msg: response.msg,list:list
      ));
    }else {
      emit(TermsFailure(msg: response.msg));
    }
  }


}
