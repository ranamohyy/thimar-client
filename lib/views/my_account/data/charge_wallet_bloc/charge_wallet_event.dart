part of 'charge_wallet_bloc.dart';

 class ChargeWalletEvents {}
class WalletChargeEvent extends ChargeWalletEvents {
    num ?transactionId;
    TextEditingController amount=TextEditingController();
 }
