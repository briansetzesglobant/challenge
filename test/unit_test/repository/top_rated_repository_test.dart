import 'package:challenge/src/core/resource/data_state.dart';
import 'package:challenge/src/data/data_source/local/challenge_data_base.dart';
import 'package:challenge/src/data/data_source/remote/api_service.dart';
import 'package:challenge/src/data/repository/repository.dart';
import 'package:challenge/src/domain/entity/movie/movie_entity.dart';
import 'package:challenge/src/domain/entity/movie/movies_list_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'top_rated_repository_test.mocks.dart';

@GenerateMocks([
  ApiService,
  ChallengeDataBase,
])
void main() {
  late Repository repository;
  late ApiService apiService;
  late ChallengeDataBase challengeDataBase;
  late DataState<MoviesListEntity> dataStateSuccess;
  late DataState<MoviesListEntity> dataStateEmpty;
  late DataState<MoviesListEntity> dataStateFailed;
  late MoviesListEntity moviesListEntity;
  late MovieEntity movieEntity;

  setUp(() {
    apiService = MockApiService();
    Get.replace(apiService);
    challengeDataBase = MockChallengeDataBase();
    Get.replace(challengeDataBase);
    repository = Repository();
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
    moviesListEntity = MoviesListEntity(
      page: 1,
      results: [
        movieEntity,
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

  group('Repository test', () {
    test(
      'getTopRatedMoviesList() should get the status success when service state is success and database data is not empty',
      () async {
        when(apiService.getTopRatedMoviesList())
            .thenAnswer((_) async => dataStateSuccess);
        when(challengeDataBase.selectMovieEntity(1))
            .thenAnswer((_) async => movieEntity);
        when(challengeDataBase.deleteMovieEntity(1))
            .thenAnswer((_) async => true);
        when(challengeDataBase.insertMovieEntity(movieEntity))
            .thenAnswer((_) async => true);
        final response = await repository.getTopRatedMoviesList();
        verify(apiService.getTopRatedMoviesList()).called(1);
        verify(challengeDataBase.selectMovieEntity(1)).called(2);
        verify(challengeDataBase.deleteMovieEntity(1)).called(1);
        //verify(challengeDataBase.insertMovieEntity(movieEntity.copyWith(category: '${movieEntity.category},${movieEntity.category}'))).called(1);
        verifyNever(challengeDataBase.insertMovieEntity(movieEntity));
        expect(
          response.data,
          dataStateSuccess.data,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'getTopRatedMoviesList() should get the status success when service state is empty and database data is not empty',
      () async {
        when(apiService.getTopRatedMoviesList())
            .thenAnswer((_) async => dataStateEmpty);
        when(challengeDataBase.selectMovieEntityByCategory('TopRated'))
            .thenAnswer((_) async => [movieEntity]);
        final response = await repository.getTopRatedMoviesList();
        verify(apiService.getTopRatedMoviesList()).called(1);
        verify(challengeDataBase.selectMovieEntityByCategory('TopRated'))
            .called(1);
        expect(
          response.data,
          dataStateSuccess.data,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'getTopRatedMoviesList() should get the status success when service state is failed and database data is not empty',
      () async {
        when(apiService.getTopRatedMoviesList())
            .thenAnswer((_) async => dataStateFailed);
        when(challengeDataBase.selectMovieEntityByCategory('TopRated'))
            .thenAnswer((_) async => [movieEntity]);
        final response = await repository.getTopRatedMoviesList();
        verify(apiService.getTopRatedMoviesList()).called(1);
        verify(challengeDataBase.selectMovieEntityByCategory('TopRated'))
            .called(1);
        expect(
          response.data,
          dataStateSuccess.data,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'getTopRatedMoviesList() should get the status empty when service state is empty and database data is empty',
      () async {
        when(apiService.getTopRatedMoviesList())
            .thenAnswer((_) async => dataStateEmpty);
        when(challengeDataBase.selectMovieEntityByCategory('TopRated'))
            .thenAnswer((_) async => []);
        final response = await repository.getTopRatedMoviesList();
        verify(apiService.getTopRatedMoviesList()).called(1);
        verify(challengeDataBase.selectMovieEntityByCategory('TopRated'))
            .called(1);
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
      'getTopRatedMoviesList() should get the status empty when service state is failed and database data is empty',
      () async {
        when(apiService.getTopRatedMoviesList())
            .thenAnswer((_) async => dataStateFailed);
        when(challengeDataBase.selectMovieEntityByCategory('TopRated'))
            .thenAnswer((_) async => []);
        final response = await repository.getTopRatedMoviesList();
        verify(apiService.getTopRatedMoviesList()).called(1);
        verify(challengeDataBase.selectMovieEntityByCategory('TopRated'))
            .called(1);
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
      'getTopRatedMoviesList() should get the status failed when service state is success and database fail',
      () async {
        Exception exception = Exception();
        when(apiService.getTopRatedMoviesList())
            .thenAnswer((_) async => dataStateSuccess);
        when(challengeDataBase.selectMovieEntity(1)).thenThrow(exception);
        when(challengeDataBase.deleteMovieEntity(1))
            .thenAnswer((_) async => true);
        when(challengeDataBase.insertMovieEntity(movieEntity))
            .thenAnswer((_) async => true);
        final response = await repository.getTopRatedMoviesList();
        verify(apiService.getTopRatedMoviesList()).called(1);
        verify(challengeDataBase.selectMovieEntity(1)).called(1);
        verifyNever(challengeDataBase.deleteMovieEntity(1));
        verifyNever(challengeDataBase.insertMovieEntity(movieEntity.copyWith(
            category: '${movieEntity.category},${movieEntity.category}')));
        verifyNever(challengeDataBase.insertMovieEntity(movieEntity));
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          'An error has occurred while loading movies: ${exception.toString()}',
        );
        assert(response is DataFailed);
      },
    );

    test(
      'getTopRatedMoviesList() should get the status failed when service state is empty and database fail',
      () async {
        Exception exception = Exception();
        when(apiService.getTopRatedMoviesList())
            .thenAnswer((_) async => dataStateEmpty);
        when(challengeDataBase.selectMovieEntityByCategory('TopRated'))
            .thenThrow(exception);
        final response = await repository.getTopRatedMoviesList();
        verify(apiService.getTopRatedMoviesList()).called(1);
        verify(challengeDataBase.selectMovieEntityByCategory('TopRated'))
            .called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          'An error has occurred while loading movies: ${exception.toString()}',
        );
        assert(response is DataFailed);
      },
    );

    test(
      'getTopRatedMoviesList() should get the status failed when service state is failed and database fail',
      () async {
        Exception exception = Exception();
        when(apiService.getTopRatedMoviesList())
            .thenAnswer((_) async => dataStateFailed);
        when(challengeDataBase.selectMovieEntityByCategory('TopRated'))
            .thenThrow(exception);
        final response = await repository.getTopRatedMoviesList();
        verify(apiService.getTopRatedMoviesList()).called(1);
        verify(challengeDataBase.selectMovieEntityByCategory('TopRated'))
            .called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          'An error has occurred while loading movies: ${exception.toString()}',
        );
        assert(response is DataFailed);
      },
    );
  });
}
