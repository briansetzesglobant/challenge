import '../movie/movie_entity.dart';

class PersonEntity {
  PersonEntity({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownFor,
    required this.knownForDepartment,
    required this.name,
    required this.popularity,
    required this.profilePath,
  });

  final bool adult;
  final int gender;
  final int id;
  final List<MovieEntity> knownFor;
  final String knownForDepartment;
  final String name;
  final num popularity;
  final String profilePath;
}
