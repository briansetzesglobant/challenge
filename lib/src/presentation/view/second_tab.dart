import 'package:challenge/src/presentation/bloc/movie_bloc.dart';
import 'package:challenge/src/presentation/widget/widget_empty.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/bloc/movie_bloc_interface.dart';
import '../../core/resource/data_state.dart';
import '../../domain/entity/movie/movies_list_entity.dart';
import '../widget/widget_error.dart';
import '../widget/widget_movies.dart';
import '../widget/widget_text.dart';

class SecondTab extends StatefulWidget {
  const SecondTab({
    super.key,
    required this.title,
  });

  final String title;

  @override
  _SecondTabState createState() => _SecondTabState();
}

class _SecondTabState extends State<SecondTab> {
  final MovieBlocInterface _blocInterface = Get.find<MovieBloc>();

  @override
  void initState() {
    super.initState();
    _blocInterface.initialize();
    _getMoviesLists();
  }

  void _getMoviesLists() async {
    _blocInterface.getPopularMoviesList();
    _blocInterface.getRecommendationsMoviesList(
        id: await _blocInterface.getTopRatedMoviesList());
  }

  @override
  void dispose() {
    _blocInterface.dispose();
    super.dispose();
  }

  Widget _getPage(DataState<MoviesListEntity> moviesList) {
    switch (moviesList.type) {
      case DataStateType.success:
        return WidgetMovies(
          movies: moviesList.data!.results,
        );
      case DataStateType.empty:
        return const WidgetEmpty(
          icon: Icons.movie,
          message: 'No movies to show',
        );
      case DataStateType.error:
        return WidgetError(
          error: moviesList.error!,
        );
    }
  }

  Widget _streamBuilder(
      String title, Stream<DataState<MoviesListEntity>> stream) {
    return Column(
      children: [
        WidgetText(
          text: title,
        ),
        StreamBuilder<DataState<MoviesListEntity>>(
          stream: stream,
          builder: (
            BuildContext context,
            AsyncSnapshot<DataState<MoviesListEntity>> snapshot,
          ) {
            if (snapshot.hasData) {
              return _getPage(snapshot.data!);
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _streamBuilder(
              'Popular Movies', _blocInterface.popularMoviesListStream),
          _streamBuilder(
              'Top Rated Movies', _blocInterface.topRatedMoviesListStream),
          _streamBuilder('Recommendations Movies from Top Rated',
              _blocInterface.recommendationsMoviesListStream),
        ],
      ),
    );
  }
}
