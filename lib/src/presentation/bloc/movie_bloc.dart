import 'dart:async';
import '../../core/bloc/movie_bloc_interface.dart';
import '../../core/resource/data_state.dart';
import '../../core/use_case/use_case_interface.dart';
import '../../domain/entity/movie/movies_list_entity.dart';
import '../../domain/use_case/implementation/popular_movie_use_case.dart';
import '../../domain/use_case/implementation/recommendations_use_case.dart';
import '../../domain/use_case/implementation/top_rated_movie_use_case.dart';

class MovieBloc extends MovieBlocInterface {
  MovieBloc();

  late final UseCaseInterface popularUseCase = PopularMovieUseCase();
  late final UseCaseInterface topRatedUseCase = TopRatedMovieUseCase();
  late final UseCaseInterface recommendationsUseCase =
      RecommendationsMovieUseCase();

  late StreamController<DataState<MoviesListEntity>>
      _popularMoviesListStreamController;
  late StreamController<DataState<MoviesListEntity>>
      _topRatedMoviesListStreamController;
  late StreamController<DataState<MoviesListEntity>>
      _recommendationsMoviesListStreamController;

  @override
  Stream<DataState<MoviesListEntity>> get popularMoviesListStream =>
      _popularMoviesListStreamController.stream;

  @override
  Stream<DataState<MoviesListEntity>> get topRatedMoviesListStream =>
      _topRatedMoviesListStreamController.stream;

  @override
  Stream<DataState<MoviesListEntity>> get recommendationsMoviesListStream =>
      _recommendationsMoviesListStreamController.stream;

  @override
  Future<void> initialize() async {
    _popularMoviesListStreamController = StreamController();
    _topRatedMoviesListStreamController = StreamController();
    _recommendationsMoviesListStreamController = StreamController();
  }

  @override
  void dispose() {
    _popularMoviesListStreamController.close();
    _topRatedMoviesListStreamController.close();
    _recommendationsMoviesListStreamController.close();
  }

  @override
  void getPopularMoviesList() async {
    final moviesList = await popularUseCase();
    _popularMoviesListStreamController.sink.add(moviesList);
  }

  @override
  void getTopRatedMoviesList() async {
    final moviesList = await topRatedUseCase();
    _topRatedMoviesListStreamController.sink.add(moviesList);
  }

  @override
  void getRecommendationsMoviesList({
    required int id,
  }) async {
    final moviesList = await recommendationsUseCase(id: id);
    _recommendationsMoviesListStreamController.sink.add(moviesList);
  }
}
