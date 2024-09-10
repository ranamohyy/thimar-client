import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../core/logic/dio_helper.dart';
import '../products_bloc/model.dart';
part  'events.dart';
part 'states.dart';

class ProductDetailsBloc extends Bloc<ProductDetailsEvents,ProductDetailsStates>{

  ProductDetailsBloc():super(ProductDetailsStates()){


    on<ProductDetailsEvent>(_getData);


  }

  Future<void>_getData(ProductDetailsEvent event,Emitter<ProductDetailsStates>emit)async

  {
    emit(ProductDetailsLoadingState());
    final response = await DioHelper.get("categories/1");

    if (response.isSuccess){
      final list =
      List<ProductModel>.from((response.data?['data']??[]).map((e)=>
          ProductModel.fromJson(e)));
      emit(ProductDetailsSuccessState(
          msg: response.msg
          , list:list

      ));

    }else {
      emit( ProductDetailsFailureState(
          errMessage: response.msg

      ));
    }




  }

}