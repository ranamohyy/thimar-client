part of 'bloc.dart';
class CartModel {
  List<ProductCartModel> data;
  int totalPriceBeforeDiscount;
  double totalDiscount;
  int totalPriceWithVat;
  int deliveryCost;
  int freeDeliveryPrice;
  double vat;
  int isVip;
  int vipDiscountPercentage;
  int minVipPrice;
  String vipMessage;
  String status;
  String message;

  CartModel({
    required this.data,
    required this.totalPriceBeforeDiscount,
    required this.totalDiscount,
    required this.totalPriceWithVat,
    required this.deliveryCost,
    required this.freeDeliveryPrice,
    required this.vat,
    required this.isVip,
    required this.vipDiscountPercentage,
    required this.minVipPrice,
    required this.vipMessage,
    required this.status,
    required this.message,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
    data: List<ProductCartModel>.from(json["data"].map((x) => ProductCartModel.fromJson(x))),
    totalPriceBeforeDiscount: json["total_price_before_discount"],
    totalDiscount: json["total_discount"]?.toDouble(),
    totalPriceWithVat: json["total_price_with_vat"],
    deliveryCost: json["delivery_cost"],
    freeDeliveryPrice: json["free_delivery_price"],
    vat: json["vat"]?.toDouble(),
    isVip: json["is_vip"],
    vipDiscountPercentage: json["vip_discount_percentage"],
    minVipPrice: json["min_vip_price"],
    vipMessage: json["vip_message"],
    status: json["status"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "total_price_before_discount": totalPriceBeforeDiscount,
    "total_discount": totalDiscount,
    "total_price_with_vat": totalPriceWithVat,
    "delivery_cost": deliveryCost,
    "free_delivery_price": freeDeliveryPrice,
    "vat": vat,
    "is_vip": isVip,
    "vip_discount_percentage": vipDiscountPercentage,
    "min_vip_price": minVipPrice,
    "vip_message": vipMessage,
    "status": status,
    "message": message,
  };
}

class ProductCartModel {
  int id;
  String title;
  String image;
  int amount;
  int priceBeforeDiscount;
  int discount;
  int price;
  int remainingAmount;

  ProductCartModel({
    required this.id,
    required this.title,
    required this.image,
    required this.amount,
    required this.priceBeforeDiscount,
    required this.discount,
    required this.price,
    required this.remainingAmount,
  });

  factory ProductCartModel.fromJson(Map<String, dynamic> json) => ProductCartModel(
    id: json["id"],
    title: json["title"],
    image: json["image"],
    amount: json["amount"],
    priceBeforeDiscount: json["price_before_discount"],
    discount: json["discount"],
    price: json["price"],
    remainingAmount: json["remaining_amount"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "image": image,
    "amount": amount,
    "price_before_discount": priceBeforeDiscount,
    "discount": discount,
    "price": price,
    "remaining_amount": remainingAmount,
  };
}
