class PersonMovieEntity {
  PersonMovieEntity({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  final bool adult;
  final String? backdropPath;
  final List<int> genreIds;
  final int id;
  final String mediaType;
  final String originalLanguage;
  final String? originalTitle;
  final String overview;
  final String? posterPath;
  final String? releaseDate;
  final String? title;
  final bool? video;
  final num voteAverage;
  final int voteCount;
}
