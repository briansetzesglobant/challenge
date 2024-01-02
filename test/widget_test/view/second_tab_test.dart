import 'dart:async';
import 'package:challenge/src/core/resource/data_state.dart';
import 'package:challenge/src/domain/entity/movie/movie_entity.dart';
import 'package:challenge/src/domain/entity/movie/movies_list_entity.dart';
import 'package:challenge/src/presentation/bloc/movie_bloc.dart';
import 'package:challenge/src/presentation/view/second_tab.dart';
import 'package:challenge/src/presentation/widget/widget_empty.dart';
import 'package:challenge/src/presentation/widget/widget_error.dart';
import 'package:challenge/src/presentation/widget/widget_movies.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'second_tab_test.mocks.dart';

@GenerateMocks([
  MovieBloc,
])
void main() {
  late MovieBloc movieBloc;
  late DataState<MoviesListEntity> dataStateSuccess;
  late DataState<MoviesListEntity> dataStateEmpty;
  late DataState<MoviesListEntity> dataStateFailed;
  late MoviesListEntity moviesListEntity;

  setUp(() {
    movieBloc = MockMovieBloc();
    Get.replace(movieBloc);
    moviesListEntity = MoviesListEntity(
      page: 1,
      results: [
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
      ],
      totalPages: 1,
      totalResults: 1,
    );
    dataStateSuccess = DataSuccess(
      moviesListEntity,
    );
    dataStateEmpty = const DataEmpty();
    dataStateFailed = const DataFailed(
      'error',
    );
  });

  group('HomePage test', () {
    testWidgets('SecondTab() should display the success page',
        (WidgetTester tester) async {
      when(movieBloc.initialize()).thenAnswer((_) async => true);
      when(movieBloc.getPopularMoviesList()).thenAnswer((_) => true);
      when(movieBloc.getTopRatedMoviesList()).thenAnswer((_) async => 1);
      when(movieBloc.getRecommendationsMoviesList(id: 1))
          .thenAnswer((_) => true);
      when(movieBloc.popularMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateSuccess));
      when(movieBloc.topRatedMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateSuccess));
      when(movieBloc.recommendationsMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateSuccess));
      await tester.pumpWidget(
        MaterialApp(
          home: SecondTab(),
        ),
      );
      await tester.pump();
      expect(find.byType(WidgetMovies), findsNWidgets(3));
      expect(find.byType(WidgetEmpty), findsNothing);
      expect(find.byType(WidgetError), findsNothing);
    });

    testWidgets('SecondTab() should display the empty page',
        (WidgetTester tester) async {
      when(movieBloc.initialize()).thenAnswer((_) async => true);
      when(movieBloc.getPopularMoviesList()).thenAnswer((_) => true);
      when(movieBloc.getTopRatedMoviesList()).thenAnswer((_) async => 1);
      when(movieBloc.getRecommendationsMoviesList(id: 1))
          .thenAnswer((_) => true);
      when(movieBloc.popularMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateEmpty));
      when(movieBloc.topRatedMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateEmpty));
      when(movieBloc.recommendationsMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateEmpty));
      await tester.pumpWidget(
        MaterialApp(
          home: SecondTab(),
        ),
      );
      await tester.pump();
      expect(find.byType(WidgetMovies), findsNothing);
      expect(find.byType(WidgetEmpty), findsNWidgets(3));
      expect(find.byType(WidgetError), findsNothing);
    });

    testWidgets('SecondTab() should display the failed page',
        (WidgetTester tester) async {
      when(movieBloc.initialize()).thenAnswer((_) async => true);
      when(movieBloc.getPopularMoviesList()).thenAnswer((_) => true);
      when(movieBloc.getTopRatedMoviesList()).thenAnswer((_) async => 1);
      when(movieBloc.getRecommendationsMoviesList(id: 1))
          .thenAnswer((_) => true);
      when(movieBloc.popularMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateFailed));
      when(movieBloc.topRatedMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateFailed));
      when(movieBloc.recommendationsMoviesListStream)
          .thenAnswer((_) => Stream.value(dataStateFailed));
      await tester.pumpWidget(
        MaterialApp(
          home: SecondTab(),
        ),
      );
      await tester.pump();
      expect(find.byType(WidgetMovies), findsNothing);
      expect(find.byType(WidgetEmpty), findsNothing);
      expect(find.byType(WidgetError), findsNWidgets(3));
    });
  });
}
