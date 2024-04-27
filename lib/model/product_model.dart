// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  String id;
  String nameUz;
  String nameRu;
  String descriptionUz;
  String descriptionRu;
  int price;
  int? quantity;
  String categoryId;
  String brandId;
  String mainImage;
  DateTime createdAt;
  DateTime updatedAt;

  Product({
    required this.id,
    required this.nameUz,
    required this.nameRu,
    required this.descriptionUz,
    required this.descriptionRu,
    required this.price,
    this.quantity,
    required this.categoryId,
    required this.brandId,
    required this.mainImage,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    nameUz: json["name_uz"],
    nameRu: json["name_ru"],
    descriptionUz: json["description_uz"],
    descriptionRu: json["description_ru"],
    price: json["price"],
    quantity: json["quantity"],
    categoryId: json["category_id"],
    brandId: json["brand_id"],
    mainImage: json["main_image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_uz": nameUz,
    "name_ru": nameRu,
    "description_uz": descriptionUz,
    "description_ru": descriptionRu,
    "price": price,
    "quantity": quantity,
    "category_id": categoryId,
    "brand_id": brandId,
    "main_image": mainImage,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
