import 'package:challenge/src/core/resource/data_state.dart';
import 'package:challenge/src/data/repository/repository.dart';
import 'package:challenge/src/domain/entity/movie/movie_entity.dart';
import 'package:challenge/src/domain/entity/movie/movies_list_entity.dart';
import 'package:challenge/src/domain/use_case/implementation/popular_movie_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'popular_movie_use_case_test.mocks.dart';

@GenerateMocks([
  Repository,
])
void main() {
  late PopularMovieUseCase popularMovieUseCase;
  late Repository repository;
  late DataState<MoviesListEntity> dataStateSuccess;
  late DataState<MoviesListEntity> dataStateEmpty;
  late DataState<MoviesListEntity> dataStateFailed;
  late MoviesListEntity moviesListEntity;

  setUp(() {
    repository = MockRepository();
    Get.replace(repository);
    popularMovieUseCase = PopularMovieUseCase();
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

  group('PopularMovieUseCase test', () {
    test(
      'call() should get the status success',
      () async {
        when(repository.getPopularMoviesList())
            .thenAnswer((_) async => dataStateSuccess);
        final response = await popularMovieUseCase();
        verify(repository.getPopularMoviesList()).called(1);
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
        when(repository.getPopularMoviesList())
            .thenAnswer((_) async => dataStateEmpty);
        final response = await popularMovieUseCase();
        verify(repository.getPopularMoviesList()).called(1);
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
        when(repository.getPopularMoviesList())
            .thenAnswer((_) async => dataStateFailed);
        final response = await popularMovieUseCase();
        verify(repository.getPopularMoviesList()).called(1);
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
