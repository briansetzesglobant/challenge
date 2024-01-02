
import 'package:challenge/src/data/model/person/persons_list.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late Map<String, dynamic> json;

  setUp(() {
    json = {
      'page': 1,
      'results': [
        {
          'adult': true,
          'gender': 1,
          'id': 1,
          'known_for': [],
          'known_for_department': 'knownForDepartment',
          'name': 'name',
          'popularity': 1.0,
          'profile_path': 'profilePath',
        },
      ],
      'total_pages': 1,
      'total_results': 1
    };
  });

  test(
    'fromJson() should transform the json to persons list model',
        () async {
      final personsListModel = PersonsList.fromJson(
        json,
      );
      expect(personsListModel.results.first.name, 'name');
    },
  );
}
