import 'package:client/convert_to_utf_8.dart';

class Suggestion {
  final String productName;
  final String description;
  final int categoryId;
  final bool isSafe;

  Suggestion(
      {required this.productName,
      required this.description,
      required this.categoryId,
      required this.isSafe});

  factory Suggestion.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'product_name': String name,
        'description': String description,
        'category_id': int categoryId,
        'is_safe': bool isSafe,
      } =>
        Suggestion(
            productName: convertToUtf8(name),
            description: convertToUtf8(description),
            categoryId: categoryId,
            isSafe: isSafe),
      _ => throw const FormatException("Failed to format suggestions")
    };
  }
}
