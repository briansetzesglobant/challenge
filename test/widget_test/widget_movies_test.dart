import 'package:challenge/src/domain/entity/movie/movie_entity.dart';
import 'package:challenge/src/presentation/widget/widget_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late List<MovieEntity> movies;

  setUp(() {
    movies = [
      MovieEntity(
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
      )
    ];
  });

  testWidgets('WidgetMovies() should display the movies',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: WidgetMovies(
          movies: movies,
        ),
      ),
    );
    expect(find.text('title'), findsOneWidget);
  });
}
