// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> welcomeFromJson(String str) => List<CategoryModel>.from(json.decode(str).map((x) => CategoryModel.fromJson(x)));

String welcomeToJson(List<CategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  String id;
  String nameUz;
  String nameRu;
  DateTime createdAt;
  DateTime updatedAt;
  String? image;
  List<CategoryModel>? subcategories;
  String? icon;
  String? parentId;

  CategoryModel({
    required this.id,
    required this.nameUz,
    required this.nameRu,
    required this.createdAt,
    required this.updatedAt,
    this.image,
    this.subcategories,
    this.icon,
    this.parentId,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"],
    nameUz: json["name_uz"],
    nameRu: json["name_ru"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    image: json["image"],
    subcategories: json["subcategories"] == null ? [] : List<CategoryModel>.from(json["subcategories"]!.map((x) => CategoryModel.fromJson(x))),
    icon: json["icon"],
    parentId: json["parent_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_uz": nameUz,
    "name_ru": nameRu,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "image": image,
    "subcategories": subcategories == null ? [] : List<dynamic>.from(subcategories!.map((x) => x.toJson())),
    "icon": icon,
    "parent_id": parentId,
  };
}
