import 'dart:convert';
import 'package:floor/floor.dart';
import '../../../../domain/entity/movie/movie_entity.dart';
import '../../../model/movie/movie.dart';

class MovieEntityConverter extends TypeConverter<List<MovieEntity>, String> {
  @override
  List<MovieEntity> decode(String databaseValue) {
    var json = jsonDecode(databaseValue) as List<dynamic>;
    return List<MovieEntity>.from(
        json.map((movieJson) => Movie.fromJson(movieJson)));
  }

  @override
  String encode(List<MovieEntity> value) {
    return jsonEncode(value.map((movie) => movie.toJson()).toList());
  }
}
