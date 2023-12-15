import '../../domain/entity/person_entity.dart';
import '../../domain/entity/person_movie_entity.dart';
import 'person_movie.dart';

class Person extends PersonEntity {
  Person({
    required bool adult,
    required int gender,
    required int id,
    required List<PersonMovieEntity> knownFor,
    required String knownForDepartment,
    required String name,
    required num popularity,
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
    List<PersonMovie> personMoviesList = jsonList
        .map((personMovie) => PersonMovie.fromJson(personMovie))
        .toList();
    return Person(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownFor: personMoviesList,
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      popularity: json['popularity'],
      profilePath: json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for': knownFor.map((personMovie) => personMovie).toList(),
      'known_for_department': knownForDepartment,
      'name': name,
      'popularity': popularity,
      'profile_path': profilePath,
    };
  }
}
