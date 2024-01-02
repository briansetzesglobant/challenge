import 'package:challenge/src/domain/entity/movie/movie_entity.dart';
import 'package:challenge/src/domain/entity/movie/movies_list_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late MovieEntity movieEntity1;
  late MovieEntity movieEntity2;
  late MovieEntity movieEntity3;
  late MoviesListEntity moviesListEntity;

  setUp(() {
    movieEntity1 = MovieEntity(
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
      title: 'title1',
      video: true,
      voteAverage: 1.0,
      voteCount: 1,
      category: 'category',
    );
    movieEntity2 = MovieEntity(
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
      title: 'title2',
      video: true,
      voteAverage: 1.0,
      voteCount: 1,
      category: 'category',
    );
    movieEntity3 = MovieEntity(
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
      title: 'title3',
      video: true,
      voteAverage: 1.0,
      voteCount: 1,
      category: 'category',
    );
    moviesListEntity = MoviesListEntity(
      page: 1,
      results: [movieEntity1, movieEntity2, movieEntity3],
      totalResults: 1,
      totalPages: 1,
    );
  });

  group('MoviesListEntity test', () {
    test(
      'copyWith() should clone movies list entity',
          () async {
        moviesListEntity = moviesListEntity.copyWith(
          page: 2,
        );
        expect(moviesListEntity.page, 2);
      },
    );

    test(
      'MoviesListEntity should be iterable',
          () async {
        final moviesListEntityIterable = MoviesListEntity(
          page: 1,
          results: [],
          totalResults: 1,
          totalPages: 1,
        );
        int i = 0;
        for (var movieEntity in moviesListEntity) {
          moviesListEntityIterable.results.add(movieEntity);
          expect(moviesListEntity.results[i].title, moviesListEntityIterable.results[i].title);
          i++;
        }
      },
    );
  });
}
