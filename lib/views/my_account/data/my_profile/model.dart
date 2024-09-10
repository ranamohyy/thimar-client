part of 'bloc.dart';
class ProfileModel {
  int? id;
  String fullname;
  String phone;
  String image;
  City city;
  int ?isVip;

  ProfileModel({
     this.id,
    required this.fullname,
    required this.phone,
    required this.image,
    required this.city,
     this.isVip,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json["id"],
    fullname: json["fullname"],
    phone: json["phone"],
    image: json["image"],
    city: City.fromJson(json["city"]),
    isVip: json["is_vip"] as int,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "fullname": fullname,
    "phone": phone,
    "image": image,
    "city": city.toJson(),
    "is_vip": isVip,
  };
}

class City {
  int ?id;
  String name;

  City({
     this.id,
    required this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
