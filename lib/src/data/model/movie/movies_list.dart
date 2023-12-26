import '../../../domain/entity/movie/movies_list_entity.dart';
import 'movie.dart';

class MoviesList extends MoviesListEntity {
  MoviesList({
    required int page,
    required List<Movie> results,
    required int totalPages,
    required int totalResults,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory MoviesList.fromJson(Map<String, dynamic> json, String category) {
    var jsonList = json['results'] as List;
    List<Movie> moviesList =
        jsonList.map((movie) => Movie.fromJson(movie, category)).toList();
    return MoviesList(
      page: json['page'],
      results: moviesList,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
