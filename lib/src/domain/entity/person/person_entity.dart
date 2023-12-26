import 'package:floor/floor.dart';
import '../movie/movie_entity.dart';

@Entity()
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

  @PrimaryKey()
  final int id;
  final bool adult;
  final int gender;
  final List<MovieEntity> knownFor;
  final String knownForDepartment;
  final String name;
  final double popularity;
  final String profilePath;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'adult': adult,
      'gender': gender,
      'id': id,
      'known_for': knownFor.map((movie) => movie.toJson()).toList(),
      'known_for_department': knownForDepartment,
      'name': name,
      'popularity': popularity,
      'profile_path': profilePath,
    };
  }
}
