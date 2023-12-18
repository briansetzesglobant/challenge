import 'movie_entity.dart';

class MoviesListEntity extends Iterable<MovieEntity> {
  MoviesListEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<MovieEntity> results;
  final int totalPages;
  final int totalResults;

  MoviesListEntity copyWith({
    int? page,
    List<MovieEntity>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return MoviesListEntity(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  @override
  Iterator<MovieEntity> get iterator => _MoviesListIterator(
        results: results,
      );
}

class _MoviesListIterator extends Iterator<MovieEntity> {
  _MoviesListIterator({
    required this.results,
  });

  final List<MovieEntity> results;
  int index = 0;

  @override
  MovieEntity get current => results[index++];

  @override
  bool moveNext() => index < results.length;
}
