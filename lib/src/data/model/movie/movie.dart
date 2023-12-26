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
    required double popularity,
    required String posterPath,
    required String releaseDate,
    required String title,
    required bool video,
    required double voteAverage,
    required int voteCount,
    required String category,
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
          category: category,
        );

  factory Movie.fromJson(Map<String, dynamic> json, [String category = '']) {
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
      popularity: json['popularity'] != null
          ? (json['popularity'] as num).toDouble()
          : 0.0,
      posterPath: json['poster_path'] ?? '',
      releaseDate: json['release_date'] ?? '',
      title: json['title'] ?? '',
      video: json['video'] ?? false,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      category: category,
    );
  }
}
