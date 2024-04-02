class Product {
  final String id;
  final String name;
  final String mainImage;
  final String description;
  final int price;
  final int quantity;
  final int categoryId;
  final List<String> mediaFiles;

  Product({
    required this.id,
    required this.name,
    required this.mainImage,
    required this.description,
    required this.price,
    required this.quantity,
    required this.categoryId,
    required this.mediaFiles,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as String,
      name: json['name'] as String,
      mainImage: json['main_image'] as String,
      description: json['description'] as String,
      price: json['price'] as int,
      quantity: json['quantity'] as int,
      categoryId: json['category_id'] as int,
      mediaFiles: (json['media_files'] as List).cast<String>(),
    );
  }

  static List<Product> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => Product.fromJson(item)).toList();
  }
}
