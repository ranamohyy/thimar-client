part of 'bloc.dart';
class RegisterEvents{}

class RegisterEvent extends RegisterEvents{
  final String fullName;
  final String phoneNumber;
  final String code;
  final String city;
  final String password;
  final String passwordConfirmation;
  RegisterEvent({required this.passwordConfirmation, required this.code ,required this.fullName, required this.phoneNumber, required this.city, required this.password});


}