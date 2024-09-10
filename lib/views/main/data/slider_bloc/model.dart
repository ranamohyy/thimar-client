
part of 'bloc.dart';

SliderModel sliderModelFromJson(String str) => SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  int id;
  String media;

  SliderModel({
    required this.id,
    required this.media,
  });

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    id: json["id"],
    media: json["media"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "media": media,
  };
}