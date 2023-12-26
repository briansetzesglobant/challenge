import '../../../domain/entity/movie/movie_entity.dart';
import '../../../domain/entity/person/person_entity.dart';
import '../movie/movie.dart';

class Person extends PersonEntity {
  Person({
    required bool adult,
    required int gender,
    required int id,
    required List<MovieEntity> knownFor,
    required String knownForDepartment,
    required String name,
    required double popularity,
    required String profilePath,
  }) : super(
          adult: adult,
          gender: gender,
          id: id,
          knownFor: knownFor,
          knownForDepartment: knownForDepartment,
          name: name,
          popularity: popularity,
          profilePath: profilePath,
        );

  factory Person.fromJson(Map<String, dynamic> json) {
    var jsonList = json['known_for'] as List;
    List<Movie> moviesList =
        jsonList.map((movie) => Movie.fromJson(movie)).toList();
    return Person(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownFor: moviesList,
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      popularity: (json['popularity'] as num).toDouble(),
      profilePath: json['profile_path'],
    );
  }
}
