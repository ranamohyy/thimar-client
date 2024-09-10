import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/logic/dio_helper.dart';

part  'events.dart';
part 'states.dart';
part '../../../../models/wallet_model.dart';
///GetWalletBloc
class GetWalletBloc extends Bloc<GetWalletEvents, GetWalletStates> {
  GetWalletBloc() : super(GetWalletInitialState()) {
    on<GetWalletEvent>( _getData) ;
    on<GetWalletPaginatedEvent>( _getPaginatedData) ;

  }

  int i =0;
  Future<void> _getData(GetWalletEvent event,Emitter<GetWalletStates>emit)async
  {
    emit(GetWalletLoadingState());
    final response = await DioHelper.get("wallet");
    if (response.isSuccess){
      final list=  WalletModel.fromJson(response.data??[]);

      emit(GetWalletSuccessState(

      msg:response.msg, list:list,
      ));

    }else {
      GetWalletFailureState(
          errMessage: response.msg
      );
    }}
  Future<void> _getPaginatedData(GetWalletPaginatedEvent event,Emitter<GetWalletStates>emit)async
  {
    emit(GetWalletPaginatedLoading());
    final response = await DioHelper.get('wallet/get_wallet_transactions');

    if (response.isSuccess){
      final list=  WalletModel.fromJson(response.data??[]);

      emit(GetWalletPaginatedSuccess(

      msg:response.msg, list:list,
      ));

    }else {
      GetWalletPaginatedFailureState(
          errMessage: response.msg
      );
    }
  }
}

