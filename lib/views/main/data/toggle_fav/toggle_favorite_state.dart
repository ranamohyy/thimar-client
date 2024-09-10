part of 'toggle_favorite_bloc.dart';
 class ToggleFavoriteFavoriteStates {}

final class ToggleFavoriteFavoriteInitial extends ToggleFavoriteFavoriteStates {}

final class ToggleFavoriteLoadingState extends ToggleFavoriteFavoriteStates {}

final class ToggleFavoriteSuccessState extends ToggleFavoriteFavoriteStates {
  final String msg;
  ToggleFavoriteSuccessState({required this.msg});

}
final class ToggleFavoriteFailureState extends ToggleFavoriteFavoriteStates{
  final String errMessage;
  ToggleFavoriteFailureState({required this.errMessage});

}
