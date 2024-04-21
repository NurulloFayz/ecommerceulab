import 'dart:convert';


class CategoryModel {
  final String id;
  final String nameUz;
  final String nameRu;
  final String image;

  CategoryModel({
    required this.id,
    required this.nameUz,
    required this.nameRu,
    required this.image,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    id: json["id"] ?? '',
    nameUz: json["name_uz"] as String,
    nameRu: json["name_ru"] as String,
    image: json["image"]as String,

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name_uz": nameUz,
    "name_ru": nameRu,
    "image": image,
  };
}


// class Subcategory {
//   final String id;
//   final String name;
//   final String? image; // Marked as nullable
//   final String parentId;
//   final List<Translation> translations;
//
//   Subcategory({
//     required this.id,
//     required this.name,
//     this.image, // Updated to nullable
//     required this.parentId,
//     required this.translations,
//   });
//
//   /// Creates a [Subcategory] from JSON data.
//   factory Subcategory.fromJson(Map<String, dynamic> json) {
//     // Parse the JSON and handle nullable values appropriately
//     return Subcategory(
//       id: json["id"] as String,
//       name: json["name_uz"] as String,
//       image: json["image"] as String?, // Handle nullable image
//       parentId: json["parent_id"] as String,
//       translations: List<Translation>.from(json["translations"]?.map((x) => Translation.fromJson(x)) ?? []),
//     );
//   }
//
//   /// Converts the [Subcategory] to JSON format.
//   Map<String, dynamic> toJson() {
//     return {
//       "id": id,
//       "name_uz": name,
//       "image": image, // Handle nullable image
//       "parent_id": parentId,
//       "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
//     };
//   }
// }
//
// class Translation {
//   final String? categoryId; // Marked as nullable
//   final String? name; // Marked as nullable
//   final String? languageCode; // Marked as nullable
//
//   Translation({
//     this.categoryId,
//     this.name,
//     this.languageCode,
//   });
//
//   /// Creates a [Translation] from JSON data.
//   factory Translation.fromJson(Map<String, dynamic> json) {
//     // Parse the JSON and handle nullable values appropriately
//     return Translation(
//       categoryId: json["category_id"] as String?,
//       name: json["name_uz"] as String?,
//       languageCode: json["language_code"] as String?,
//     );
//   }
//
//   /// Converts the [Translation] to JSON format.
//   Map<String, dynamic> toJson() {
//     // Return only non-null values
//     final Map<String, dynamic> data = {
//       "category_id": categoryId,
//       "name_uz": name,
//       "language_code": languageCode,
//     };
//
//     // Filter out null values from the map
//     data.removeWhere((key, value) => value == null);
//     return data;
//   }
// }
