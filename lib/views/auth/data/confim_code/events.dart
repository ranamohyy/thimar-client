part of 'bloc.dart';
abstract class ConfirmationCodeEvents{}
class SendCodeEvent extends ConfirmationCodeEvents{
final String type;
   final String registerCode;
  final String PhoneNumber;
  final String Code;
  SendCodeEvent({required this.type,  required this.Code,
    required this.PhoneNumber , required  this.registerCode});

}