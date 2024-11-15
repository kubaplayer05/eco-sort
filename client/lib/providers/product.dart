import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

part 'product.g.dart';

@riverpod
Future<List<Product>> getProducts(Ref ref) async {
  const apiPrefix = "http://127.0.0.1:3000";
  final url = Uri.parse("$apiPrefix/product/newest");

  final response = await http.get(url, headers: {
    "Content-Type": "application/json",
  });

  if (response.statusCode ~/ 100 != 2) {
    throw Exception("Failed to fetch products");
  }

  List<dynamic> jsonList = json.decode(response.body);
  List<Product> products =
      jsonList.map((json) => Product.fromJson(json)).toList();

  return products;
}

@riverpod
Future<List<Product>> searchProduct(Ref ref, String productName) async {
  const apiPrefix = "http://127.0.0.1:3000";
  final url = Uri.parse("$apiPrefix/product/search/$productName");

  final response = await http.get(url, headers: {
    "Content-Type": "application/json",
  });

  if (response.statusCode ~/ 100 != 2) {
    throw Exception("Failed to fetch products");
  }

  List<dynamic> jsonList = json.decode(response.body);
  List<Product> products =
      jsonList.map((json) => Product.fromJson(json)).toList();

  return products;
}
