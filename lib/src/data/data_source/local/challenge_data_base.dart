import 'package:challenge/src/data/data_source/local/app_data_base.dart';
import 'package:challenge/src/domain/entity/person/person_entity.dart';
import '../../../domain/entity/movie/movie_entity.dart';

class ChallengeDataBase {
  ChallengeDataBase._privateConstructor();

  static final ChallengeDataBase instance =
      ChallengeDataBase._privateConstructor();

  late final AppDataBase challengeDataBase;

  Future<void> init() async {
    challengeDataBase =
        await $FloorAppDataBase.databaseBuilder('app_data_base.db').build();
  }

  Future<List<PersonEntity>> selectAllPersonEntity() async {
    return challengeDataBase.personEntityDao.selectAllPersonEntity();
  }

  Future<void> insertPersonEntity(PersonEntity personEntity) async {
    challengeDataBase.personEntityDao.insertPersonEntity(personEntity);
  }

  Future<void> deleteAllPersonEntity() async {
    challengeDataBase.personEntityDao.deleteAllPersonEntity();
  }

  Future<List<MovieEntity>> selectAllMovieEntity() async {
    return challengeDataBase.movieEntityDao.selectAllMovieEntity();
  }

  Future<MovieEntity?> selectMovieEntity(int id) async {
    return challengeDataBase.movieEntityDao.selectMovieEntity(id);
  }

  Future<void> insertMovieEntity(MovieEntity movieEntity) async {
    challengeDataBase.movieEntityDao.insertMovieEntity(movieEntity);
  }

  Future<void> deleteMovieEntity(int id) async {
    challengeDataBase.movieEntityDao.deleteMovieEntity(id);
  }

  Future<List<MovieEntity>> selectMovieEntityByCategory(String category) async {
    List<MovieEntity> movies = [];
    List<MovieEntity> movieEntityList = await selectAllMovieEntity();
    for (var movieEntity in movieEntityList) {
      if (movieEntity.category.contains(category)) {
        movies.add(movieEntity);
      }
    }
    return movies;
  }
}
