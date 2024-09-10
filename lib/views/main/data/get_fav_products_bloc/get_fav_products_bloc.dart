import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'package:thimar/views/main/data/get_fav_products_bloc/fav_produt_model.dart';

part 'get_fav_products_event.dart';
part 'get_fav_products_state.dart';

class GetFavProductsBloc extends Bloc<GeFavProductsEvent, GetFavProductsStates> {
  GetFavProductsBloc() : super(GetFavProductsStates()) {
    on<GeFavProductsEvent>(_getData);

  }

  Future<void>_getData (GeFavProductsEvent event,Emitter<GetFavProductsStates>emit)async{
    emit(GeFavProductsLoadingState());
    var response =await DioHelper.get('client/products/favorites');
    final list= List<FavoriteProductModel>.from((response.data?['data']??[]).map((e)=>FavoriteProductModel.fromJson(e)));
    if(response.isSuccess){
      emit(GeFavProductsSuccessState(msg: response.data['message'],
      list: list
      ));
    }else{emit (GeFavProductsFailureState(errMessage: response.msg));
    }

  }


}
