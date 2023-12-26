import 'package:floor/floor.dart';
import '../../../../../domain/entity/movie/movie_entity.dart';

@dao
abstract class MovieEntityDao {
  @Query('SELECT * FROM MovieEntity')
  Future<List<MovieEntity>> selectAllMovieEntity();

  @Query('SELECT * FROM MovieEntity WHERE id = :id')
  Future<MovieEntity?> selectMovieEntity(int id);

  @insert
  Future<void> insertMovieEntity(MovieEntity movieEntity);

  @Query('DELETE FROM MovieEntity WHERE id = :id')
  Future<void> deleteMovieEntity(int id);
}
