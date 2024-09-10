part of '../views/my_account/data/addreses/bloc.dart';
class AddressModel {
  int id;
  String type;
  double lat;
  double lng;
  String location;
  String description;
  bool isDefault;
  String phone;

  AddressModel({
    required this.id,
    required this.type,
    required this.lat,
    required this.lng,
    required this.location,
    required this.description,
    required this.isDefault,
    required this.phone,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
    id: json["id"],
    type: json["type"],
    lat: json["lat"]?.toDouble(),
    lng: json["lng"]?.toDouble(),
    location: json["location"],
    description: json["description"],
    isDefault: json["is_default"],
    phone: json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "lat": lat,
    "lng": lng,
    "location": location,
    "description": description,
    "is_default": isDefault,
    "phone": phone,
  };
}
