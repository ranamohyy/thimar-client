part of 'bloc.dart';

class ShowCartStates{}

class ShowCartInitialState extends ShowCartStates{}


class ShowCartLoadingState extends ShowCartStates {}


class ShowCartSuccessState extends ShowCartStates {

  final String msg;
  final  CartModel list;

  ShowCartSuccessState({required this.msg, required this.list});

}


class ShowCartFailureState extends ShowCartStates {

  final String errMessage;

  ShowCartFailureState({required this.errMessage});

}
