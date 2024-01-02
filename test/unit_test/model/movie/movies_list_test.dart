import 'package:challenge/src/data/model/movie/movies_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> json;

  setUp(() {
    json = {
      'page': 1,
      'results': [
        {
          'poster_path': 'posterPath',
          'adult': true,
          'overview': 'overview',
          'release_date': 'releaseDate',
          'genre_ids': [],
          'id': 1,
          'original_title': 'originalTitle',
          'original_language': 'originalLanguage',
          'title': 'title',
          'backdrop_path': 'backdropPath',
          'popularity': 1.0,
          'vote_count': 1,
          'video': true,
          'vote_average': 1.0,
          'category': 'category',
        },
      ],
      'total_pages': 1,
      'total_results': 1
    };
  });

  test(
    'fromJson() should transform the json to movies list model',
        () async {
      final moviesListModel = MoviesList.fromJson(
        json,
        '',
      );
      expect(moviesListModel.results.first.title, 'title');
    },
  );
}
