import 'package:challenge/src/domain/entity/movie/movies_list_entity.dart';
import 'package:challenge/src/domain/entity/person/person_entity.dart';
import 'package:challenge/src/domain/entity/person/persons_list_entity.dart';
import 'package:get/get.dart';
import '../../core/resource/data_state.dart';
import '../../core/util/strings.dart';
import '../../domain/entity/movie/movie_entity.dart';
import '../data_source/local/challenge_data_base.dart';
import '../data_source/remote/api_service.dart';
import '../../domain/repository/repository_interface.dart';

class Repository extends RepositoryInterface {
  final ApiService apiService = Get.find<ApiService>();
  final ChallengeDataBase challengeDataBase = Get.find<ChallengeDataBase>();

  @override
  Future<DataState<PersonsListEntity>> getPersonsList() async {
    DataState<PersonsListEntity> personsList =
        await apiService.getPersonsList();
    switch (personsList.type) {
      case DataStateType.success:
        try {
          challengeDataBase.deleteAllPersonEntity();
          for (var person in personsList.data!) {
            await challengeDataBase.insertPersonEntity(person);
          }
          return DataSuccess(
            personsList.data!.copyWith(
              results: await challengeDataBase.selectAllPersonEntity(),
            ),
          );
        } catch (exception) {
          return DataFailed(
            '${Strings.errorMessage} ${exception.toString()}',
          );
        }
      case DataStateType.empty:
        return await _getDataOfDataBasePerson();
      case DataStateType.error:
        return await _getDataOfDataBasePerson();
    }
  }

  Future<DataState<PersonsListEntity>> _getDataOfDataBasePerson() async {
    try {
      List<PersonEntity> results =
          await challengeDataBase.selectAllPersonEntity();
      if (results.isNotEmpty) {
        return DataSuccess(
          PersonsListEntity(
            page: 1,
            results: results,
            totalResults: 20,
            totalPages: 1,
          ),
        );
      } else {
        return const DataEmpty();
      }
    } catch (exception) {
      return DataFailed(
        '${Strings.errorMessage} ${exception.toString()}',
      );
    }
  }

  @override
  Future<DataState<MoviesListEntity>> getPopularMoviesList() async {
    DataState<MoviesListEntity> moviesList =
        await apiService.getPopularMoviesList();
    return switchMovies(moviesList, 'Popular');
  }

  @override
  Future<DataState<MoviesListEntity>> getTopRatedMoviesList() async {
    DataState<MoviesListEntity> moviesList =
        await apiService.getTopRatedMoviesList();
    return switchMovies(moviesList, 'TopRated');
  }

  @override
  Future<DataState<MoviesListEntity>> getRecommendationsMoviesList({
    required int? id,
  }) async {
    DataState<MoviesListEntity> moviesList =
        await apiService.getRecommendationsMoviesList(id: id);
    return switchMovies(moviesList, 'Recommendations');
  }

  Future<DataState<MoviesListEntity>> switchMovies(
      DataState<MoviesListEntity> moviesList, String category) async {
    switch (moviesList.type) {
      case DataStateType.success:
        try {
          for (var movie in moviesList.data!) {
            MovieEntity? movieEntity =
                await challengeDataBase.selectMovieEntity(movie.id);
            if (movieEntity != null) {
              challengeDataBase.deleteMovieEntity(movie.id);
              await challengeDataBase.insertMovieEntity(movie.copyWith(
                  category: '${movieEntity.category},${movie.category}'));
            } else {
              await challengeDataBase.insertMovieEntity(movie);
            }
          }
          List<MovieEntity> movieList = [];
          for (var movie in moviesList.data!) {
            movieList
                .add((await challengeDataBase.selectMovieEntity(movie.id))!);
          }
          return DataSuccess(
            moviesList.data!.copyWith(
              results: movieList,
            ),
          );
        } catch (exception) {
          return DataFailed(
            '${Strings.errorMessage} ${exception.toString()}',
          );
        }
      case DataStateType.empty:
        return await _getDataOfDataBaseMovie(category);
      case DataStateType.error:
        return await _getDataOfDataBaseMovie(category);
    }
  }

  Future<DataState<MoviesListEntity>> _getDataOfDataBaseMovie(
      String category) async {
    try {
      List<MovieEntity> results =
          await challengeDataBase.selectMovieEntityByCategory(category);
      if (results.isNotEmpty) {
        return DataSuccess(
          MoviesListEntity(
            page: 1,
            results: results,
            totalResults: 20,
            totalPages: 1,
          ),
        );
      } else {
        return const DataEmpty();
      }
    } catch (exception) {
      return DataFailed(
        '${Strings.errorMessage} ${exception.toString()}',
      );
    }
  }
}
