part of 'resend_code_bloc.dart';
 class ResendCodeEvents{}
 class ResendCodeEvent extends ResendCodeEvents {
   final String type;
   final String phoneNumber;
   final String Code;

   ResendCodeEvent( {required this.Code,required this.type,required this.phoneNumber


   });

 }
