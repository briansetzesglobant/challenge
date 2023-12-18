import 'package:challenge/src/domain/entity/person/persons_list_entity.dart';
import '../../core/resource/data_state.dart';
import '../entity/movie/movies_list_entity.dart';

abstract class RepositoryInterface {
  Future<DataState<PersonsListEntity>> getPersonsList();

  Future<DataState<MoviesListEntity>> getPopularMoviesList();

  Future<DataState<MoviesListEntity>> getTopRatedMoviesList();

  Future<DataState<MoviesListEntity>> getRecommendationsMoviesList({
    required int id,
  });
}
