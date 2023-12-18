import '../../../domain/entity/movie/movie_entity.dart';

class Movie extends MovieEntity {
  Movie({
    required bool adult,
    required String backdropPath,
    required List<int> genreIds,
    required int id,
    required String mediaType,
    required String originalLanguage,
    required String originalTitle,
    required String overview,
    required num popularity,
    required String posterPath,
    required String releaseDate,
    required String title,
    required bool video,
    required num voteAverage,
    required int voteCount,
  }) : super(
          adult: adult,
          backdropPath: backdropPath,
          genreIds: genreIds,
          id: id,
          mediaType: mediaType,
          originalLanguage: originalLanguage,
          originalTitle: originalTitle,
          overview: overview,
          popularity: popularity,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          video: video,
          voteAverage: voteAverage,
          voteCount: voteCount,
        );

  factory Movie.fromJson(Map<String, dynamic> json) {
    var jsonList = json['genre_ids'] as List?;
    List<int> genreIdsList =
        jsonList?.map((genreId) => genreId as int).toList() ?? [];
    return Movie(
      adult: json['adult'],
      backdropPath: json['backdrop_path'] ?? '',
      genreIds: genreIdsList,
      id: json['id'],
      mediaType: json['media_type'] ?? '',
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'] ?? '',
      overview: json['overview'],
      popularity: json['popularity'] ?? 0.0,
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'adult': adult,
      'backdrop_path': backdropPath,
      'genre_ids': genreIds.map((genreId) => genreId).toList(),
      'id': id,
      'media_type': mediaType,
      'original_language': originalLanguage,
      'original_title': originalTitle,
      'overview': overview,
      'popularity': popularity,
      'poster_path': posterPath,
      'release_date': releaseDate,
      'title': title,
      'video': video,
      'vote_average': voteAverage,
      'vote_count': voteCount,
    };
  }
}
