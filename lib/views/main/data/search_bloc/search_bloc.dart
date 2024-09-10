import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar/core/logic/dio_helper.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchStates> {
  SearchBloc() : super(SearchSuccessState()) {
    on<SearchEvent>(_getData) {

  }Future<void>_getData(SearchEvent event,Emitter<SearchStates>state)async{
      await DioHelper.get('search',parameter: {
     "keyword":event.keyWord,
     "min_price":event.minPrice,
     "max_price":event.maxPrice,


      });

    }
    }
}
class SearchBCategoryBloc extends Bloc<SearchEvent, SearchStates> {
  SearchBCategoryBloc() : super(SearchCategoryLoadingState()) {
    on<SearchEvent>(_getData) {

  }

  Future<void>_getData(SearchEvent event,Emitter<SearchStates>state)async{
    emit(SearchCategoryLoadingState());
    final response=await DioHelper.get('search',parameter: {
     "keyword":event.keyWord,



      });

    }
    }
}
