part of '../views/my_account/data/get_wallet/bloc.dart';

class WalletModel {
  List<Datum> data;
  num ?wallet;

  WalletModel({
    required this.data,
     this.wallet,
  });

  factory WalletModel.fromJson(Map<String, dynamic> json) => WalletModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    wallet: json["wallet"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "wallet": wallet,
  };
}

class Datum {
  int id;
  num amount;
  num beforeCharge;
  num afterCharge;
  DateTime date;
  String statusTrans;
  String status;
  String transactionType;
  String modelType;
  int modelId;
  String state;

  Datum({
    required this.id,
    required this.amount,
    required this.beforeCharge,
    required this.afterCharge,
    required this.date,
    required this.statusTrans,
    required this.status,
    required this.transactionType,
    required this.modelType,
    required this.modelId,
    required this.state,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    amount: json["amount"],
    beforeCharge: json["before_charge"],
    afterCharge: json["after_charge"],
    date: DateTime.parse(json["date"]),
    statusTrans: json["status_trans"],
    status: json["status"],
    transactionType: json["transaction_type"],
    modelType: json["model_type"],
    modelId: json["model_id"],
    state: json["state"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "amount": amount,
    "before_charge": beforeCharge,
    "after_charge": afterCharge,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "status_trans": statusTrans,
    "status": status,
    "transaction_type": transactionType,
    "model_type": modelType,
    "model_id": modelId,
    "state": state,
  };
}
