import 'package:challenge/src/presentation/widget/first_tab/person_movies.dart';
import 'package:flutter/material.dart';
import '../../../domain/entity/person_movie_entity.dart';
import 'person_image.dart';
import 'person_name.dart';
import 'person_popularity.dart';

class PersonPage extends StatelessWidget {
  final String personName;
  final String posterPath;
  final num popularity;
  final List<PersonMovieEntity> movies;

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
          PersonName(
            name: personName,
          ),
          PersonImage(
            posterPath: posterPath,
          ),
          PersonPopularity(
            popularity: popularity,
          ),
          PersonMovies(
            movies: movies,
          ),
        ],
      ),
    );
  }
}
