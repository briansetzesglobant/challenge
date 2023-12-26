import 'dart:async';
import 'package:challenge/src/data/data_source/local/converters/IntConverter.dart';
import 'package:challenge/src/data/data_source/local/converters/movie_entity_coverter.dart';
import 'package:challenge/src/domain/entity/movie/movie_entity.dart';
import 'package:challenge/src/domain/entity/person/person_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'DAOs/movie_dao/movie_entity_dao.dart';
import 'DAOs/person_dao/person_entity_dao.dart';

part 'app_data_base.g.dart'; // the generated code will be there

@TypeConverters([
  MovieEntityConverter,
  IntConverter,
])
@Database(version: 1, entities: [PersonEntity, MovieEntity])
abstract class AppDataBase extends FloorDatabase {
  PersonEntityDao get personEntityDao;

  MovieEntityDao get movieEntityDao;
}
