
class SimilarProducts {
  int categoryId;
  int id;
  String title;
  String description;
  String code;
  int priceBeforeDiscount;
  double price;
  num discount;
  int amount;
  int isActive;
  bool isFavorite;
  Unit unit;
  List<dynamic> images;
  String mainImage;
  DateTime createdAt;

  SimilarProducts({
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
    required this.unit,
    required this.images,
    required this.mainImage,
    required this.createdAt,
  });

  factory SimilarProducts.fromJson(Map<String, dynamic> json) => SimilarProducts(
    categoryId: json["category_id"],
    id: json["id"],
    title: json["title"],
    description: json["description"],
    code: json["code"],
    priceBeforeDiscount: json["price_before_discount"],
    price: json["price"]?.toDouble(),
    discount: json["discount"]?.toDouble(),
    amount: json["amount"],
    isActive: json["is_active"],
    isFavorite: json["is_favorite"],
    unit: Unit.fromJson(json["unit"]),
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
    "unit": unit.toJson(),
    "images": List<dynamic>.from(images.map((x) => x)),
    "main_image": mainImage,
    "created_at": "${createdAt.year.toString().padLeft(4, '0')}-${createdAt.month.toString().padLeft(2, '0')}-${createdAt.day.toString().padLeft(2, '0')}",
  };
}

class Unit {
  int id;
  String name;
  String type;
  DateTime createdAt;
  DateTime updatedAt;

  Unit({
    required this.id,
    required this.name,
    required this.type,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
