part of 'add_address_bloc.dart';

 class AddAddressStates {}

final class AddAddressLoadingState extends AddAddressStates {}
final class AddAddressSuccessState extends AddAddressStates {
   final String msg;

  AddAddressSuccessState({required this.msg});

}
final class AddAddressFailureState extends AddAddressStates {
   final String errMessage;

  AddAddressFailureState({required this.errMessage});
}
