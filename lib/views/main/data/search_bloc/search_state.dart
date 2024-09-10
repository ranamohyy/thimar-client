part of 'search_bloc.dart';

 class SearchStates {}

final class SearchLoadingState extends SearchStates {}
final class SearchSuccessState extends SearchStates {

}
final class SearchFailureInitial extends SearchStates {}

final class SearchCategoryLoadingState extends SearchStates {}
final class SearchCategorySuccessState extends SearchStates {

}
final class SearchCategoryFailureInitial extends SearchStates {}
