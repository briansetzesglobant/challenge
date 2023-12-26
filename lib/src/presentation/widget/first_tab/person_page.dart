import 'package:challenge/src/presentation/widget/widget_movies.dart';
import 'package:flutter/material.dart';
import '../../../domain/entity/movie/movie_entity.dart';
import '../widget_text.dart';
import 'person_image.dart';
import 'person_popularity.dart';

class PersonPage extends StatelessWidget {
  final String personName;
  final String posterPath;
  final num popularity;
  final List<MovieEntity> movies;

  const PersonPage({
    super.key,
    required this.personName,
    required this.posterPath,
    required this.popularity,
    required this.movies,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          WidgetText(
            text: personName,
          ),
          PersonImage(
            posterPath: posterPath,
          ),
          PersonPopularity(
            popularity: popularity,
          ),
          WidgetMovies(
            movies: movies,
          ),
        ],
      ),
    );
  }
}
