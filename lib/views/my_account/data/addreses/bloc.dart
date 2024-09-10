import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/dio_helper.dart';

part  'events.dart';
part 'states.dart';
part '../../../../models/addresses_model.dart';
///show  addresses
class ShowAddressesBloc extends Bloc<ShowAddressesEvents, ShowAddressStates>
{
  ShowAddressesBloc() : super(ShowAddressInitialState()) {
    on<ShowAddressesEvent>( _getData) ;
  }

  Future<void> _getData(ShowAddressesEvent event,Emitter<ShowAddressStates>emit)async
  {
    emit(ShowAddressLoadingState());
    final response = await DioHelper.get("client/addresses");
    if (response.isSuccess){
      final list = List<AddressModel>.from((response.data ?['data']??[]).map((e)=>AddressModel.fromJson(e)));

      emit(ShowAddressSuccessStates(
        msg:response.msg, list:list,
      ));

    }else {
      emit(ShowAddressFailureState( errMessage: response.msg)
      );
    }
  }
}
///delete  address
class DeleteAddressBloc  extends Bloc<DeleteAddressesEvent, ShowAddressStates>
{
  DeleteAddressBloc() : super(ShowAddressInitialState()) {
    on<DeleteAddressesEvent>( _sendData) ;
  }

  Future<void> _sendData(DeleteAddressesEvent event,Emitter<ShowAddressStates>emit)async{
    emit(DeleteAddressInitialState());
    final response = await DioHelper.delete('client/addresses/${event.id}');
    if(response.isSuccess){
      emit(DeleteAddressSuccessStates(msg: response.msg));
    }else {
      emit (DeleteAddressFailureState(errMessage: response.msg));
    }

  }
  }

  ///edit type address
class EditAddressBloc  extends Bloc<EditAddressesEvent, ShowAddressStates>
{
  EditAddressBloc() : super(ShowAddressInitialState()) {
    on<EditAddressesEvent>( _sendData) ;
  }

  Future<void> _sendData(EditAddressesEvent event,Emitter<ShowAddressStates>emit)async{

   emit(EditAddressInitialState());
  final response = await DioHelper.put('client/addresses/${event.id}',data: {
    'type':event.type
  });
   if(response.isSuccess){
     emit(EditAddressSuccessStates(msg: response.msg));
   }else {
     emit (EditAddressFailureState(errMessage: response.msg));
   }

  }

  }
