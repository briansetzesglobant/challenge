// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_data_base.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorAppDataBase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder databaseBuilder(String name) =>
      _$AppDataBaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDataBaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDataBaseBuilder(null);
}

class _$AppDataBaseBuilder {
  _$AppDataBaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDataBaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDataBaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDataBase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDataBase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDataBase extends AppDataBase {
  _$AppDataBase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  PersonEntityDao? _personEntityDaoInstance;

  MovieEntityDao? _movieEntityDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `PersonEntity` (`id` INTEGER NOT NULL, `adult` INTEGER NOT NULL, `gender` INTEGER NOT NULL, `knownFor` TEXT NOT NULL, `knownForDepartment` TEXT NOT NULL, `name` TEXT NOT NULL, `popularity` REAL NOT NULL, `profilePath` TEXT NOT NULL, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `MovieEntity` (`id` INTEGER NOT NULL, `adult` INTEGER NOT NULL, `backdropPath` TEXT NOT NULL, `genreIds` TEXT NOT NULL, `mediaType` TEXT NOT NULL, `originalLanguage` TEXT NOT NULL, `originalTitle` TEXT NOT NULL, `overview` TEXT NOT NULL, `popularity` REAL NOT NULL, `posterPath` TEXT NOT NULL, `releaseDate` TEXT NOT NULL, `title` TEXT NOT NULL, `video` INTEGER NOT NULL, `voteAverage` REAL NOT NULL, `voteCount` INTEGER NOT NULL, `category` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  PersonEntityDao get personEntityDao {
    return _personEntityDaoInstance ??=
        _$PersonEntityDao(database, changeListener);
  }

  @override
  MovieEntityDao get movieEntityDao {
    return _movieEntityDaoInstance ??=
        _$MovieEntityDao(database, changeListener);
  }
}

class _$PersonEntityDao extends PersonEntityDao {
  _$PersonEntityDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _personEntityInsertionAdapter = InsertionAdapter(
            database,
            'PersonEntity',
            (PersonEntity item) => <String, Object?>{
                  'id': item.id,
                  'adult': item.adult ? 1 : 0,
                  'gender': item.gender,
                  'knownFor': _movieEntityConverter.encode(item.knownFor),
                  'knownForDepartment': item.knownForDepartment,
                  'name': item.name,
                  'popularity': item.popularity,
                  'profilePath': item.profilePath
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PersonEntity> _personEntityInsertionAdapter;

  @override
  Future<List<PersonEntity>> selectAllPersonEntity() async {
    return _queryAdapter.queryList('SELECT * FROM PersonEntity',
        mapper: (Map<String, Object?> row) => PersonEntity(
            adult: (row['adult'] as int) != 0,
            gender: row['gender'] as int,
            id: row['id'] as int,
            knownFor: _movieEntityConverter.decode(row['knownFor'] as String),
            knownForDepartment: row['knownForDepartment'] as String,
            name: row['name'] as String,
            popularity: row['popularity'] as double,
            profilePath: row['profilePath'] as String));
  }

  @override
  Future<void> deleteAllPersonEntity() async {
    await _queryAdapter.queryNoReturn('DELETE FROM PersonEntity');
  }

  @override
  Future<void> insertPersonEntity(PersonEntity personEntity) async {
    await _personEntityInsertionAdapter.insert(
        personEntity, OnConflictStrategy.abort);
  }
}

class _$MovieEntityDao extends MovieEntityDao {
  _$MovieEntityDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _movieEntityInsertionAdapter = InsertionAdapter(
            database,
            'MovieEntity',
            (MovieEntity item) => <String, Object?>{
                  'id': item.id,
                  'adult': item.adult ? 1 : 0,
                  'backdropPath': item.backdropPath,
                  'genreIds': _intConverter.encode(item.genreIds),
                  'mediaType': item.mediaType,
                  'originalLanguage': item.originalLanguage,
                  'originalTitle': item.originalTitle,
                  'overview': item.overview,
                  'popularity': item.popularity,
                  'posterPath': item.posterPath,
                  'releaseDate': item.releaseDate,
                  'title': item.title,
                  'video': item.video ? 1 : 0,
                  'voteAverage': item.voteAverage,
                  'voteCount': item.voteCount,
                  'category': item.category
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<MovieEntity> _movieEntityInsertionAdapter;

  @override
  Future<List<MovieEntity>> selectAllMovieEntity() async {
    return _queryAdapter.queryList('SELECT * FROM MovieEntity',
        mapper: (Map<String, Object?> row) => MovieEntity(
            adult: (row['adult'] as int) != 0,
            backdropPath: row['backdropPath'] as String,
            genreIds: _intConverter.decode(row['genreIds'] as String),
            id: row['id'] as int,
            mediaType: row['mediaType'] as String,
            originalLanguage: row['originalLanguage'] as String,
            originalTitle: row['originalTitle'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as double,
            posterPath: row['posterPath'] as String,
            releaseDate: row['releaseDate'] as String,
            title: row['title'] as String,
            video: (row['video'] as int) != 0,
            voteAverage: row['voteAverage'] as double,
            voteCount: row['voteCount'] as int,
            category: row['category'] as String));
  }

  @override
  Future<MovieEntity?> selectMovieEntity(int id) async {
    return _queryAdapter.query('SELECT * FROM MovieEntity WHERE id = ?1',
        mapper: (Map<String, Object?> row) => MovieEntity(
            adult: (row['adult'] as int) != 0,
            backdropPath: row['backdropPath'] as String,
            genreIds: _intConverter.decode(row['genreIds'] as String),
            id: row['id'] as int,
            mediaType: row['mediaType'] as String,
            originalLanguage: row['originalLanguage'] as String,
            originalTitle: row['originalTitle'] as String,
            overview: row['overview'] as String,
            popularity: row['popularity'] as double,
            posterPath: row['posterPath'] as String,
            releaseDate: row['releaseDate'] as String,
            title: row['title'] as String,
            video: (row['video'] as int) != 0,
            voteAverage: row['voteAverage'] as double,
            voteCount: row['voteCount'] as int,
            category: row['category'] as String),
        arguments: [id]);
  }

  @override
  Future<void> deleteMovieEntity(int id) async {
    await _queryAdapter.queryNoReturn('DELETE FROM MovieEntity WHERE id = ?1',
        arguments: [id]);
  }

  @override
  Future<void> insertMovieEntity(MovieEntity movieEntity) async {
    await _movieEntityInsertionAdapter.insert(
        movieEntity, OnConflictStrategy.abort);
  }
}

// ignore_for_file: unused_element
final _movieEntityConverter = MovieEntityConverter();
final _intConverter = IntConverter();
