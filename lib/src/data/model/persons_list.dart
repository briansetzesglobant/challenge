import '../../domain/entity/persons_list_entity.dart';
import 'person.dart';

class PersonsList extends PersonsListEntity {
  PersonsList({
    required int page,
    required List<Person> results,
    required int totalPages,
    required int totalResults,
  }) : super(
          page: page,
          results: results,
          totalPages: totalPages,
          totalResults: totalResults,
        );

  factory PersonsList.fromJson(Map<String, dynamic> json) {
    var jsonList = json['results'] as List;
    List<Person> personsList =
        jsonList.map((person) => Person.fromJson(person)).toList();
    return PersonsList(
      page: json['page'],
      results: personsList,
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }
}
