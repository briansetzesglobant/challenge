import 'package:challenge/src/domain/entity/person/person_entity.dart';
import 'package:challenge/src/domain/entity/person/persons_list_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PersonEntity personEntity1;
  late PersonEntity personEntity2;
  late PersonEntity personEntity3;
  late PersonsListEntity personsListEntity;

  setUp(() {
    personEntity1 = PersonEntity(
      adult: true,
      gender: 1,
      id: 1,
      knownFor: [],
      knownForDepartment: 'knownForDepartment',
      name: 'name1',
      popularity: 1.0,
      profilePath: 'profilePath',
    );
    personEntity2 = PersonEntity(
      adult: true,
      gender: 1,
      id: 1,
      knownFor: [],
      knownForDepartment: 'knownForDepartment',
      name: 'name2',
      popularity: 1.0,
      profilePath: 'profilePath',
    );
    personEntity3 = PersonEntity(
      adult: true,
      gender: 1,
      id: 1,
      knownFor: [],
      knownForDepartment: 'knownForDepartment',
      name: 'name3',
      popularity: 1.0,
      profilePath: 'profilePath',
    );
    personsListEntity = PersonsListEntity(
      page: 1,
      results: [
        personEntity1,
        personEntity2,
        personEntity3,
      ],
      totalResults: 1,
      totalPages: 1,
    );
  });

  group('PersonsListEntity test', () {
    test(
      'copyWith() should clone persons list entity',
      () async {
        personsListEntity = personsListEntity.copyWith(
          page: 2,
        );
        expect(personsListEntity.page, 2);
      },
    );

    test(
      'PersonsListEntity should be iterable',
      () async {
        final personsListEntityIterable = PersonsListEntity(
          page: 1,
          results: [],
          totalResults: 1,
          totalPages: 1,
        );
        int i = 0;
        for (var personEntity in personsListEntity) {
          personsListEntityIterable.results.add(personEntity);
          expect(personsListEntity.results[i].name,
              personsListEntityIterable.results[i].name);
          i++;
        }
      },
    );
  });
}
