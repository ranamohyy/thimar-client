part of 'bloc.dart';

class ShowAddressStates {}

final class ShowAddressLoadingState extends ShowAddressStates {}
final class ShowAddressInitialState extends ShowAddressStates {}
final class ShowAddressSuccessStates extends ShowAddressStates {
  final String msg;
  final List<AddressModel>list;
  ShowAddressSuccessStates({required this.msg,required this.list});

}
final class ShowAddressFailureState extends ShowAddressStates {
  final String errMessage;

  ShowAddressFailureState({required this.errMessage});
}





///delete address states
final class DeleteAddressInitialState extends ShowAddressStates {}
final class DeleteAddressSuccessStates extends ShowAddressStates {
  final String msg;
  DeleteAddressSuccessStates({required this.msg,});

}
final class DeleteAddressFailureState extends ShowAddressStates {
  final String errMessage;

  DeleteAddressFailureState({required this.errMessage});
}


///edit type address states
final class EditAddressInitialState extends ShowAddressStates {}
final class EditAddressSuccessStates extends ShowAddressStates {
  final String msg;
  EditAddressSuccessStates({required this.msg});

}
final class EditAddressFailureState extends ShowAddressStates {
  final String errMessage;

  EditAddressFailureState({required this.errMessage});
}
