import 'package:challenge/src/core/resource/data_state.dart';
import 'package:challenge/src/data/repository/repository.dart';
import 'package:challenge/src/domain/entity/movie/movie_entity.dart';
import 'package:challenge/src/domain/entity/movie/movies_list_entity.dart';
import 'package:challenge/src/domain/use_case/implementation/recommendations_movie_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'recommendations_movie_use_case_test.mocks.dart';

@GenerateMocks([
  Repository,
])
void main() {
  late RecommendationsMovieUseCase recommendationsMovieUseCase;
  late Repository repository;
  late DataState<MoviesListEntity> dataStateSuccess;
  late DataState<MoviesListEntity> dataStateEmpty;
  late DataState<MoviesListEntity> dataStateFailed;
  late MoviesListEntity moviesListEntity;

  setUp(() {
    repository = MockRepository();
    Get.replace(repository);
    recommendationsMovieUseCase = RecommendationsMovieUseCase();
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

  group('RecommendationsUseCase test', () {
    test(
      'call() should get the status success',
      () async {
        when(repository.getRecommendationsMoviesList(id: 1))
            .thenAnswer((_) async => dataStateSuccess);
        final response = await recommendationsMovieUseCase(id: 1);
        verify(repository.getRecommendationsMoviesList(id: 1)).called(1);
        expect(
          response.data!.results.first,
          dataStateSuccess.data!.results.first,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'call() should get the status empty',
      () async {
        when(repository.getRecommendationsMoviesList(id: null))
            .thenAnswer((_) async => dataStateEmpty);
        final response = await recommendationsMovieUseCase();
        verify(repository.getRecommendationsMoviesList(id: null)).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataEmpty);
      },
    );

    test(
      'call() should get the status failed',
      () async {
        when(repository.getRecommendationsMoviesList(id: null))
            .thenAnswer((_) async => dataStateFailed);
        final response = await recommendationsMovieUseCase();
        verify(repository.getRecommendationsMoviesList(id: null)).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          dataStateFailed.error,
        );
        assert(response is DataFailed);
      },
    );
  });
}
