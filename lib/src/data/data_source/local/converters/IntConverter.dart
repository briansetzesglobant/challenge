import 'dart:convert';
import 'package:floor/floor.dart';

class IntConverter extends TypeConverter<List<int>, String> {
  @override
  List<int> decode(String databaseValue) {
    var json = jsonDecode(databaseValue) as List<dynamic>;
    return List<int>.from(json.map((genreId) => genreId));
  }

  @override
  String encode(List<int> value) {
    return jsonEncode(value.map((genreId) => genreId).toList());
  }
}
