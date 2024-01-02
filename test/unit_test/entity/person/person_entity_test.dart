import 'package:challenge/src/domain/entity/person/person_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PersonEntity personEntity;

  setUp(() {
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
  });

  test(
    'toJson() should transform the person entity to json',
        () async {
      final personEntityJson = personEntity.toJson();
      expect(personEntityJson['name'], 'name');
    },
  );
}
