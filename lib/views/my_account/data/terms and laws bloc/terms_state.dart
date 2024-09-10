part of 'terms_bloc.dart';

 class TermsStates {}

 class TermsInitial extends TermsStates {}
 class TermsLoading extends TermsStates {}
 class TermsSuccess extends TermsStates {
  final TermsModel list;
  final String msg;
  TermsSuccess( {required this.msg,required this.list,});}

 class TermsFailure extends TermsStates {
  final String msg;

  TermsFailure({required this.msg});
}
