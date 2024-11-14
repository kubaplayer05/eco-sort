class Product {
  final int id;
  final String name;
  final String? description;
  final String categoryName;

  Product(
      {required this.id,
      required this.name,
      this.description,
      required this.categoryName});

  factory Product.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'description': String? description,
        'category_name': String categoryName
      } =>
        Product(
            id: id,
            name: name,
            description: description,
            categoryName: categoryName),
      _ => throw const FormatException("Failed to format products")
    };
  }
}


