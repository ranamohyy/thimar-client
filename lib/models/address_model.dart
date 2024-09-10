class AddressModel {
  String featureType;
  String elementType;
  List<Styler> stylers;

  AddressModel({
    required this.featureType,
    required this.elementType,
    required this.stylers,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    featureType: json["featureType"],
    elementType: json["elementType"],
    stylers: List<Styler>.from(json["stylers"].map((x) => Styler.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "featureType": featureType,
    "elementType": elementType,
    "stylers": List<dynamic>.from(stylers.map((x) => x.toJson())),
  };
}

class Styler {
  String? color;
  String? visibility;
  int? saturation;

  Styler({
    this.color,
    this.visibility,
    this.saturation,
  });

  factory Styler.fromJson(Map<String, dynamic> json) => Styler(
    color: json["color"],
    visibility: json["visibility"],
    saturation: json["saturation"],
  );

  Map<String, dynamic> toJson() => {
    "color": color,
    "visibility": visibility,
    "saturation": saturation,
  };
}
