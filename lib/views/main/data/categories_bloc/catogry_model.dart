class CategoryModel {
  int id;
  String name;
  String description;
  String media;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    required this.media,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    name: json["name"]??'',
    description: json["description"],
    media: json["media"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "media": media,
  };
}
