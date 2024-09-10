class TermsModel {
  Data data;
  String status;
  String message;

  TermsModel({
    required this.data,
    required this.status,
    required this.message,
  });

  factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
    data: Data.fromJson(json["data"]),
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "status": status,
    "message": message,
  };
}

class Data {
  String terms;

  Data({
    required this.terms,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    terms: json["terms"],
  );

  Map<String, dynamic> toJson() => {
    "terms": terms,
  };
}
