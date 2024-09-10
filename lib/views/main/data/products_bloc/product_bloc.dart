import 'package:bloc/bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';

import 'model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvents, ProductStates> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>(_getData);
  
  }
  
  
  
  Future<void>_getData(
      ProductEvent event,Emitter<ProductStates>emit)async
  {
    emit(ProductLoadingState());
    final response =await DioHelper.get("products?category_id=1");
    if (response.isSuccess){
      final list= List<ProductModel>.from((response.data?['data']??[]).map((e)=>
        ProductModel.fromJson(e)));

    emit(ProductSuccessState(
        msg:response.msg ,
         list:list

      ));
    }
    else {
      emit (ProductFailureState(
        errMessage: response.msg

      ));

    }

  }


}
