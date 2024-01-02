import 'package:challenge/src/data/data_source/local/challenge_data_base.dart';
import 'package:challenge/src/domain/entity/movie/movie_entity.dart';
import 'package:challenge/src/domain/entity/person/person_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ChallengeDataBase challengeDatabase;
  late PersonEntity personEntity;
  late MovieEntity movieEntity;

  setUpAll(() async {
    challengeDatabase = ChallengeDataBase.instance;
    await challengeDatabase.init();
    personEntity = PersonEntity(
      adult: true,
      gender: 1,
      id: 1,
      knownFor: [],
      knownForDepartment: 'knownForDepartment',
      name: 'name',
      popularity: 1.0,
      profilePath: 'profilePath',
    );
    movieEntity = MovieEntity(
      adult: true,
      backdropPath: 'backdropPath',
      genreIds: [],
      id: 1,
      mediaType: 'mediaType',
      originalLanguage: 'originalLanguage',
      originalTitle: 'originalTitle',
      overview: 'overview',
      popularity: 1.0,
      posterPath: 'posterPath',
      releaseDate: 'releaseDate',
      title: 'title',
      video: true,
      voteAverage: 1.0,
      voteCount: 1,
      category: 'category',
    );
  });

  group('ChallengeDataBase test', () {
    test(
      'Person methods test',
      () async {
        await challengeDatabase.insertPersonEntity(personEntity);
        final personsNotEmpty = await challengeDatabase.selectAllPersonEntity();
        expect(personsNotEmpty.length, 1);
        await challengeDatabase.deleteAllPersonEntity();
        final personsEmpty = await challengeDatabase.selectAllPersonEntity();
        expect(personsEmpty.length, 0);
      },
    );

    test(
      'Movie methods test',
      () async {
        challengeDatabase.insertMovieEntity(movieEntity);
        var moviesNotEmpty = await challengeDatabase.selectAllMovieEntity();
        expect(moviesNotEmpty.length, 1);
        final movieNotEmpty = await challengeDatabase.selectMovieEntity(1);
        expect(movieNotEmpty!.title, 'title');
        moviesNotEmpty =
            await challengeDatabase.selectMovieEntityByCategory('category');
        expect(moviesNotEmpty.length, 1);
        await challengeDatabase.deleteMovieEntity(1);
        final moviesEmpty = await challengeDatabase.selectAllMovieEntity();
        expect(moviesEmpty.length, 0);
      },
    );
  });
}
