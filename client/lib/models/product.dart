import 'package:client/convert_to_utf_8.dart';

class Product {
  final int id;
  final String name;
  final String? description;
  final String categoryName;
  final int categoryId;

  Product({
    required this.id,
    required this.name,
    this.description,
    required this.categoryName,
    required this.categoryId,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'name': String name,
        'description': String? description,
        'category_name': String categoryName,
        'category_id': int categoryId
      } =>
        Product(
            id: id,
            name: convertToUtf8(name),
            description:
                description != null ? convertToUtf8(description) : null,
            categoryName: convertToUtf8(categoryName),
            categoryId: categoryId),
      _ => throw const FormatException("Failed to format products")
    };
  }
}
