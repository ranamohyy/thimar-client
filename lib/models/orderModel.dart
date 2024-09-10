class OrderModel {
  int id;
  String status;
  DateTime date;
  String time;
  num orderPrice;
  num deliveryPrice;
  num totalPrice;
  String clientName;
  String phone;
  String location;
  String deliveryPayer;
  List<Product> products;
  String payType;
  String note;
  int isVip;
  int vipDiscountPercentage;

  OrderModel({
    required this.id,
    required this.status,
    required this.date,
    required this.time,
    required this.orderPrice,
    required this.deliveryPrice,
    required this.totalPrice,
    required this.clientName,
    required this.phone,
    required this.location,
    required this.deliveryPayer,
    required this.products,
    required this.payType,
    required this.note,
    required this.isVip,
    required this.vipDiscountPercentage,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
    id: json["id"],
    status: json["status"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    orderPrice: json["order_price"],
    deliveryPrice: json["delivery_price"],
    totalPrice: json["total_price"],
    clientName: json["client_name"],
    phone: json["phone"],
    location: json["location"],
    deliveryPayer: json["delivery_payer"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    payType: json["pay_type"],
    note: json["note"]??'',
    isVip: json["is_vip"],
    vipDiscountPercentage: json["vip_discount_percentage"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "status": status,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time": time,
    "order_price": orderPrice,
    "delivery_price": deliveryPrice,
    "total_price": totalPrice,
    "client_name": clientName,
    "phone": phone,
    "location": location,
    "delivery_payer": deliveryPayer,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "pay_type": payType,
    "note": note,
    "is_vip": isVip,
    "vip_discount_percentage": vipDiscountPercentage,
  };
}

class Product {
  String name;
  String url;

  Product({
    required this.name,
    required this.url,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "url": url,
  };
}
