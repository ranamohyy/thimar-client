part of 'bloc.dart';
class ResetPasswordEvents{}
class ResetPasswordEvent extends ResetPasswordEvents{

  final String phone;
  final String code;
  final String passsword;

  ResetPasswordEvent({required this.phone, required this.code, required this.passsword});


}