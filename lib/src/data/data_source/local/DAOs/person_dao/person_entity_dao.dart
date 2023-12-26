import 'package:floor/floor.dart';
import '../../../../../domain/entity/person/person_entity.dart';

@dao
abstract class PersonEntityDao {
  @Query('SELECT * FROM PersonEntity')
  Future<List<PersonEntity>> selectAllPersonEntity();

  @insert
  Future<void> insertPersonEntity(PersonEntity personEntity);

  @Query('DELETE FROM PersonEntity')
  Future<void> deleteAllPersonEntity();
}
