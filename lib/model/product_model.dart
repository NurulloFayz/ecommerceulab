
import 'dart:convert';

List<Product> productFromJson(String str) => List<Product>.from(json.decode(str).map((x) => Product.fromJson(x)));

String productToJson(List<Product> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Product {
  final String id;
  final String nameUz;
  final String nameRu;
  final String descriptionUz;
  final String descriptionRu;
  final int price;
  final int quantity;
  final String categoryId;
  final String brandId;
  final String mainImage;
  final int rating;
  final dynamic imageFiles;
  final dynamic videoFiles;
  final DateTime createdAt;
  final DateTime updatedAt;

  Product({
    required this.id,
    required this.nameUz,
    required this.nameRu,
    required this.descriptionUz,
    required this.descriptionRu,
    required this.price,
    required this.quantity,
    required this.categoryId,
    required this.brandId,
    required this.mainImage,
    required this.rating,
    required this.imageFiles,
    required this.videoFiles,
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
    rating: json["rating"],
    imageFiles: json["image_files"],
    videoFiles: json["video_files"],
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
    "rating": rating,
    "image_files": imageFiles,
    "video_files": videoFiles,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}




// static List<Product> fromJsonList(List<dynamic> jsonList) {
// return jsonList.map((item) => Product.fromJson(item)).toList();
// }