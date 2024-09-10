
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';

part 'toggle_favorite_event.dart';
part 'toggle_favorite_state.dart';

class ToggleFavBloc extends Bloc<ToggleFavoriteEvents, ToggleFavoriteFavoriteStates> {
  ToggleFavBloc() : super(ToggleFavoriteFavoriteStates()) {
    on<ToggleFavoriteEvent>(_sendData);
    }
    Future<void>_sendData (ToggleFavoriteEvent event, Emitter<ToggleFavoriteFavoriteStates>emit)async{
    final response = await DioHelper.send(
      event.is_favorite == true?
          'client/products/${event.id}/remove_from_favorite':
        'client/products/${event.id}/add_to_favorite',

        data:{
      'id': event.id,
       'is_favorite':event.is_favorite
     }
    );

    if(response.isSuccess){

      emit( ToggleFavoriteSuccessState(msg: response.msg));
    }
    else{
      emit(ToggleFavoriteFailureState(errMessage: response.msg));
    }
    
    }
  }

