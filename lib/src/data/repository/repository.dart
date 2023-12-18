import 'package:challenge/src/domain/entity/movie/movies_list_entity.dart';
import 'package:challenge/src/domain/entity/person/persons_list_entity.dart';
import '../../core/resource/data_state.dart';
import '../data_source/remote/api_service.dart';
import '../../domain/repository/repository_interface.dart';

class Repository extends RepositoryInterface {
  final ApiService apiService = ApiService();

  @override
  Future<DataState<PersonsListEntity>> getPersonsList() async {
    return await apiService.getPersonsList();
  }

  @override
  Future<DataState<MoviesListEntity>> getPopularMoviesList() async {
    return await apiService.getPopularMoviesList();
  }

  @override
  Future<DataState<MoviesListEntity>> getTopRatedMoviesList() async {
    return await apiService.getTopRatedMoviesList();
  }

  @override
  Future<DataState<MoviesListEntity>> getRecommendationsMoviesList({
    required int id,
  }) async {
    return await apiService.getRecommendationsMoviesList(id: id);
  }
}
