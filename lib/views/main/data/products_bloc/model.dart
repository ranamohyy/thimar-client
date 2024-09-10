import 'dart:convert';

// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);



ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  int ?categoryId;
  int ?id;
  String title;
  String description;
  String code;
  num priceBeforeDiscount;
  num price;
  num discount;
  num amount;
  int ?isActive;
  bool ?isFavorite;
  List<dynamic>? images;
  String mainImage;
  DateTime? createdAt;

  ProductModel({
    required this.categoryId,
    required this.id,
    required this.title,
    required this.description,
    required this.code,
    required this.priceBeforeDiscount,
    required this.price,
    required this.discount,
    required this.amount,
    required this.isActive,
    required this.isFavorite,
    // required this.unit,
    required this.images,
    required this.mainImage,
    required this.createdAt,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    categoryId: json["category_id"],
    id: json["id"],
    title: json["title"].toString(),
    description: json["description"],
    code: json["code"],
    priceBeforeDiscount: json["price_before_discount"],
    price: json["price"], // 7.0
    discount: json["discount"]?.toDouble(),
    amount: json["amount"],
    isActive: json["is_active"],
    isFavorite: json["is_favorite"],
    // unit: Unit.fromJson(json["unit"]),
    images: List<dynamic>.from(json["images"].map((x) => x)),
    mainImage: json["main_image"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "id": id,
    "title": title,
    "description": description,
    "code": code,
    "price_before_discount": priceBeforeDiscount,
    "price": price,
    "discount": discount,
    "amount": amount,
    "is_active": isActive,
    "is_favorite": isFavorite,
    // "unit": unit!.toJson(),
    "images": List<dynamic>.from(images!.map((x) => x)),
    "main_image": mainImage,
    "created_at": "${createdAt!.year.toString().padLeft(4, '0')}-${createdAt!.month.toString().padLeft(2, '0')}-${createdAt!.day.toString().padLeft(2, '0')}"
  };
}

