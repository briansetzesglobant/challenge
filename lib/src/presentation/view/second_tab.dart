import 'package:challenge/src/presentation/bloc/movie_bloc.dart';
import 'package:challenge/src/presentation/widget/widget_title.dart';
import 'package:flutter/material.dart';

import '../../core/bloc/movie_bloc_interface.dart';
import '../../core/resource/data_state.dart';
import '../../domain/entity/movie/movies_list_entity.dart';
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
  final MovieBlocInterface _blocInterface = MovieBloc();

  @override
  void initState() {
    super.initState();
    _blocInterface.initialize();
    _blocInterface.getPopularMoviesList();
    _blocInterface.getTopRatedMoviesList();
    _blocInterface.getRecommendationsMoviesList(id: 3);
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
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.account_circle_outlined,
              size: 100.0,
            ),
            WidgetText(
              text: 'No person to show',
            ),
          ],
        );
      case DataStateType.error:
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error,
              size: 100.0,
            ),
            WidgetText(
              text: moviesList.error!,
            ),
          ],
        );
    }
  }

  Widget _streamBuilder(
      String title, Stream<DataState<MoviesListEntity>> stream) {
    return Column(
      children: [
        WidgetTitle(
          title: title,
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
          _streamBuilder('Recommendations Movies',
              _blocInterface.recommendationsMoviesListStream),
        ],
      ),
    );
  }
}
