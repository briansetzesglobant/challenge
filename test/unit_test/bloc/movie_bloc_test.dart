import 'package:challenge/src/core/resource/data_state.dart';
import 'package:challenge/src/domain/entity/movie/movie_entity.dart';
import 'package:challenge/src/domain/entity/movie/movies_list_entity.dart';
import 'package:challenge/src/domain/use_case/implementation/popular_movie_use_case.dart';
import 'package:challenge/src/domain/use_case/implementation/recommendations_movie_use_case.dart';
import 'package:challenge/src/domain/use_case/implementation/top_rated_movie_use_case.dart';
import 'package:challenge/src/presentation/bloc/movie_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'movie_bloc_test.mocks.dart';

@GenerateMocks([
  PopularMovieUseCase,
  TopRatedMovieUseCase,
  RecommendationsMovieUseCase,
])
void main() {
  late MovieBloc movieBloc;
  late PopularMovieUseCase popularMovieUseCase;
  late TopRatedMovieUseCase topRatedMovieUseCase;
  late RecommendationsMovieUseCase recommendationsMovieUseCase;
  late DataState<MoviesListEntity> dataStateSuccess;
  late DataState<MoviesListEntity> dataStateEmpty;
  late DataState<MoviesListEntity> dataStateFailed;
  late MoviesListEntity moviesListEntity;

  setUp(() {
    movieBloc = MovieBloc();
    popularMovieUseCase = MockPopularMovieUseCase();
    topRatedMovieUseCase = MockTopRatedMovieUseCase();
    recommendationsMovieUseCase = MockRecommendationsMovieUseCase();
    Get.replace(popularMovieUseCase);
    Get.replace(topRatedMovieUseCase);
    Get.replace(recommendationsMovieUseCase);
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

  group('MovieBloc test', () {
    test(
      'getPopularMoviesList() should get the status success',
      () async {
        when(popularMovieUseCase()).thenAnswer((_) async => dataStateSuccess);
        await movieBloc.initialize();
        movieBloc.getPopularMoviesList();
        verify(popularMovieUseCase()).called(1);
      },
    );

    test(
      'getPopularMoviesList() should get the status empty',
      () async {
        when(popularMovieUseCase()).thenAnswer((_) async => dataStateEmpty);
        await movieBloc.initialize();
        movieBloc.getPopularMoviesList();
        verify(popularMovieUseCase()).called(1);
      },
    );

    test(
      'getPopularMoviesList() should get the status failed',
      () async {
        when(popularMovieUseCase()).thenAnswer((_) async => dataStateFailed);
        await movieBloc.initialize();
        movieBloc.getPopularMoviesList();
        verify(popularMovieUseCase()).called(1);
      },
    );
  });

  group('MovieBloc test', () {
    test(
      'getTopRatedMoviesList() should get the status success',
      () async {
        when(topRatedMovieUseCase()).thenAnswer((_) async => dataStateSuccess);
        await movieBloc.initialize();
        int? id = await movieBloc.getTopRatedMoviesList();
        verify(topRatedMovieUseCase()).called(1);
        expect(id, 1);
      },
    );

    test(
      'getTopRatedMoviesList() should get the status empty',
      () async {
        when(topRatedMovieUseCase()).thenAnswer((_) async => dataStateEmpty);
        await movieBloc.initialize();
        int? id = await movieBloc.getTopRatedMoviesList();
        verify(topRatedMovieUseCase()).called(1);
        expect(id, null);
      },
    );

    test(
      'getTopRatedMoviesList() should get the status failed',
      () async {
        when(topRatedMovieUseCase()).thenAnswer((_) async => dataStateFailed);
        await movieBloc.initialize();
        int? id = await movieBloc.getTopRatedMoviesList();
        verify(topRatedMovieUseCase()).called(1);
        expect(id, null);
      },
    );
  });

  group('MovieBloc test', () {
    test(
      'getRecommendationsMoviesList() should get the status success',
      () async {
        when(recommendationsMovieUseCase(id: 1))
            .thenAnswer((_) async => dataStateSuccess);
        await movieBloc.initialize();
        movieBloc.getRecommendationsMoviesList(id: 1);
        verify(recommendationsMovieUseCase(id: 1)).called(1);
      },
    );

    test(
      'getRecommendationsMoviesList() should get the status empty',
      () async {
        when(recommendationsMovieUseCase(id: null))
            .thenAnswer((_) async => dataStateEmpty);
        await movieBloc.initialize();
        movieBloc.getRecommendationsMoviesList(id: null);
        verify(recommendationsMovieUseCase(id: null)).called(1);
      },
    );

    test(
      'getRecommendationsMoviesList() should get the status failed',
      () async {
        when(recommendationsMovieUseCase(id: null))
            .thenAnswer((_) async => dataStateFailed);
        await movieBloc.initialize();
        movieBloc.getRecommendationsMoviesList(id: null);
        verify(recommendationsMovieUseCase(id: null)).called(1);
      },
    );
  });

  test('dispose() should close all observers', () async {
    await movieBloc.initialize();
    movieBloc.dispose();
  });
}
