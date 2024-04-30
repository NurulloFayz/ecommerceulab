

class ProductBasket {
  final String id;
  final String mainImage;
  final String nameRu;
  final String nameUz;
  final int price;
  final int quantity;

  ProductBasket({
    required this.id,
    required this.mainImage,
    required this.nameRu,
    required this.nameUz,
    required this.price,
    required this.quantity,
  });

  factory ProductBasket.fromJson(Map<String, dynamic> json) {
    return ProductBasket(
      id: json['id'],
      mainImage: json['main_image'],
      nameRu: json['name_ru'],
      nameUz: json['name_uz'],
      price: json['price'],
      quantity: json['quantity'],
    );
  }
}

class ProductList {
  final List<ProductBasket> products;
  final int totalPrice;

  ProductList({
    required this.products,
    required this.totalPrice,
  });

  factory ProductList.fromJson(Map<String, dynamic> json) {
    List<ProductBasket> products = (json['products'] as List)
        .map((productJson) => ProductBasket.fromJson(productJson))
        .toList();

    return ProductList(
      products: products,
      totalPrice: json['total_price'],
    );
  }
}
