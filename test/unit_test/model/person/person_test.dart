import 'package:challenge/src/data/model/person/person.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> json;

  setUp(() {
    json = {
      'adult': true,
      'gender': 1,
      'id': 1,
      'known_for': [],
      'known_for_department': 'knownForDepartment',
      'name': 'name',
      'popularity': 1.0,
      'profile_path': 'profilePath',
    };
  });

  test(
    'fromJson() should transform the json to person model',
        () async {
      final personModel = Person.fromJson(
        json,
      );
      expect(personModel.name, 'name');
    },
  );
}
