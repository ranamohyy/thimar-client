
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';
import 'Similar_product_model.dart';

part 'similar_products_event.dart';
part 'similar_products_state.dart';

class SimilarProductsBloc extends Bloc<SimilarProductsEvents, SimilarProductsStates> {
  SimilarProductsBloc() : super(SimilarProductsStates()) {
    on<SimilarProductsEvent>(_sendData) ;}


Future<void>_sendData(SimilarProductsEvent event,Emitter<SimilarProductsStates>emit)async{
    emit(SimilarProductsLoading());
    final response = await DioHelper.get('products',
      parameter: {
      'category_id':event.categoryId
      }
    );

    if(response.isSuccess){
      final list = List<SimilarProducts>.from((response.data?['data']??[]).map((e)=>
        SimilarProducts.fromJson(e)));
      emit(SimilarProductsSuccessState(msg: response.msg,list: list,


      ));
    }
    else{
emit(SimilarProductsFailureState(errMessage: response.msg));
    }



}


}
