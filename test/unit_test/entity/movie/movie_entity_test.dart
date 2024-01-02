import 'package:challenge/src/domain/entity/movie/movie_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MovieEntity movieEntity;

  setUp(() {
    movieEntity = MovieEntity(
      adult: true,
      backdropPath: 'backdropPath',
      genreIds: [],
      id: 1,
      mediaType: 'mediaType',
      originalLanguage: 'originalLanguage',
      originalTitle: 'originalTitle',
      overview: 'overview',
      popularity: 1.0,
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
      title: 'title',
      video: true,
      voteAverage: 1.0,
      voteCount: 1,
      category: 'category',
    );
  });

  group('Movie test', () {
    test(
      'toJson() should transform the movie entity to json',
          () async {
        final movieEntityJson = movieEntity.toJson();
        expect(movieEntityJson['title'], 'title');
      },
    );

    test(
      'copyWith() should clone movie entity',
          () async {
        final movieEntityCopy = movieEntity.copyWith(title: 'titleCopy');
        expect(movieEntityCopy.title, 'titleCopy');
      },
    );
  });
}
