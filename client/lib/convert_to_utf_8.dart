import 'dart:convert';

String convertToUtf8(String value) {
  var utf8runes = value.runes.toList();
  return utf8.decode(utf8runes);
}
