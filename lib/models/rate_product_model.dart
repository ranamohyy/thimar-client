class RateProductModel {
  int value;
  String comment;
  String clientName;
  String clientImage;

  RateProductModel({
    required this.value,
    required this.comment,
    required this.clientName,
    required this.clientImage,
  });

  factory RateProductModel.fromJson(Map<String, dynamic> json) => RateProductModel(
    value: json["value"],
    comment: json["comment"],
    clientName: json["client_name"],
    clientImage: json["client_image"],
  );

  Map<String, dynamic> toJson() => {
    "value": value,
    "comment": comment,
    "client_name": clientName,
    "client_image": clientImage,
  };
}
