 part of 'bloc_bloc.dart';

 class LogInEvents {}
 class LogInEvent extends LogInEvents {
  final String password;
  final String phone;
  final String code;
   String ?city;



 LogInEvent(this.city, {required this.password,required this.phone,required this.code});}
