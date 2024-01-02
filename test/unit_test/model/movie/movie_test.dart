import 'package:challenge/src/data/model/movie/movie.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> json;

  setUp(() {
    json = {
      'adult': true,
      'backdrop_path': 'backdropPath',
      'genre_ids': [],
      'id': 1,
      'media_type': 'mediaType',
      'original_language': 'originalLanguage',
      'original_title': 'originalTitle',
      'overview': 'overview',
      'popularity': 1.0,
      'poster_path': 'posterPath',
      'release_date': 'releaseDate',
      'title': 'title',
      'video': true,
      'vote_average': 1.0,
      'vote_count': 1,
      'category': 'category',
    };
  });

  test(
    'fromJson() should transform the json to movie model',
        () async {
      final movieModel = Movie.fromJson(
        json,
      );
      expect(movieModel.title, 'title');
    },
  );
}
