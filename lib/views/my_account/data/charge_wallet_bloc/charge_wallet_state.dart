part of 'charge_wallet_bloc.dart';

sealed class ChargeWalletStates {}

final class ChargeWalletInitial extends ChargeWalletStates {}
final class WalletChargeLoadingState extends ChargeWalletStates {}
final class WalletChargeSuccessState extends ChargeWalletStates {

  final String msg;
  WalletChargeSuccessState({required this.msg});
}
final class ChargeWalletFailure extends ChargeWalletStates {

  final String errMessage;
  ChargeWalletFailure({required this.errMessage});

}
