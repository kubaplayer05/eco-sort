import 'dart:convert';

import 'package:client/models/suggestion.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'suggestion.g.dart';

@riverpod
Future<List<Suggestion>> getSuggestions(Ref ref, String productName) async {
  const apiPrefix = "https://eco-sort.bstrama.com/api";
  final url = Uri.parse("$apiPrefix/genai/suggestion");

  final response = await http.post(url, headers: {
    "Content-Type": "application/json",
  }, body: json.encode({"product_name": productName}));

  if (response.statusCode ~/ 100 != 2) {
    throw Exception("Failed to fetch suggestions");
  }

  List<dynamic> jsonList = json.decode(response.body);
  List<Suggestion> suggestions =
      jsonList.map((json) => Suggestion.fromJson(json)).toList();

  return suggestions;
}
