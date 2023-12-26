import 'package:challenge/src/domain/entity/movie/movies_list_entity.dart';
import '../resource/data_state.dart';
import 'bloc.dart';

abstract class MovieBlocInterface extends Bloc {
  Stream<DataState<MoviesListEntity>> get popularMoviesListStream;

  Stream<DataState<MoviesListEntity>> get topRatedMoviesListStream;

  Stream<DataState<MoviesListEntity>> get recommendationsMoviesListStream;

  void getPopularMoviesList();

  Future<int?> getTopRatedMoviesList();

  void getRecommendationsMoviesList({
    required int? id,
  });
}
