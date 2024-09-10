part of 'bloc.dart';
class GetWalletStates {}
///GetWalletStates
final class GetWalletInitialState extends GetWalletStates {}
final class GetWalletLoadingState extends GetWalletStates {}
final class GetWalletSuccessState extends GetWalletStates {
  final String msg;
  final WalletModel list;
  GetWalletSuccessState({required this.msg,required this.list});
}
final class GetWalletFailureState extends GetWalletStates{
  final String errMessage;
  GetWalletFailureState({required this.errMessage});

}


///GetWalletPaginatedLoading
final class GetWalletPaginatedLoading extends GetWalletStates {}
final class GetWalletPaginatedInitial extends GetWalletStates {}

final class GetWalletPaginatedSuccess extends GetWalletStates {
  final String msg;
  final WalletModel list;
  GetWalletPaginatedSuccess({required this.msg,required this.list});

}
final class  GetWalletPaginatedFailureState extends GetWalletStates{
  final String errMessage;
  GetWalletPaginatedFailureState({required this.errMessage});

}
