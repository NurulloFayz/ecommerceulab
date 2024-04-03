
class CategoryModel {
 final String name;
 final  String image;

  CategoryModel({
    required this.name,
    required this.image });
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }

  static List<CategoryModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => CategoryModel.fromJson(item)).toList();
  }
}