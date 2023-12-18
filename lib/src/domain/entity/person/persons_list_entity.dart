import 'person_entity.dart';

class PersonsListEntity extends Iterable<PersonEntity> {
  PersonsListEntity({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<PersonEntity> results;
  final int totalPages;
  final int totalResults;

  PersonsListEntity copyWith({
    int? page,
    List<PersonEntity>? results,
    int? totalPages,
    int? totalResults,
  }) {
    return PersonsListEntity(
      page: page ?? this.page,
      results: results ?? this.results,
      totalPages: totalPages ?? this.totalPages,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  @override
  Iterator<PersonEntity> get iterator => _PersonsListIterator(
    results: results,
  );
}

class _PersonsListIterator extends Iterator<PersonEntity> {
  _PersonsListIterator({
    required this.results,
  });

  final List<PersonEntity> results;
  int index = 0;

  @override
  PersonEntity get current => results[index++];

  @override
  bool moveNext() => index < results.length;
}
