import 'package:challenge/src/core/resource/data_state.dart';
import 'package:challenge/src/data/repository/repository.dart';
import 'package:challenge/src/domain/entity/person/person_entity.dart';
import 'package:challenge/src/domain/entity/person/persons_list_entity.dart';
import 'package:challenge/src/domain/use_case/implementation/person_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'person_use_case_test.mocks.dart';

@GenerateMocks([
  Repository,
])
void main() {
  late PersonUseCase personUseCase;
  late Repository repository;
  late DataState<PersonsListEntity> dataStateSuccess;
  late DataState<PersonsListEntity> dataStateEmpty;
  late DataState<PersonsListEntity> dataStateFailed;
  late PersonsListEntity personsListEntity;

  setUp(() {
    repository = MockRepository();
    Get.replace(repository);
    personUseCase = PersonUseCase();
    personsListEntity = PersonsListEntity(
        page: 1,
        results: [
          PersonEntity(
            adult: true,
            gender: 1,
            id: 1,
            knownFor: [],
            knownForDepartment: 'knownForDepartment',
            name: 'name',
            popularity: 1.0,
            profilePath: 'profilePath',
          )
        ],
        totalPages: 1,
        totalResults: 1);
    dataStateSuccess = DataSuccess(
      personsListEntity,
    );
    dataStateEmpty = const DataEmpty();
    dataStateFailed = const DataFailed(
      'error',
    );
  });

  group('PersonUseCase test', () {
    test(
      'call() should get the status success',
      () async {
        when(repository.getPersonsList())
            .thenAnswer((_) async => dataStateSuccess);
        final response = await personUseCase();
        verify(repository.getPersonsList()).called(1);
        expect(
          response.data!.results.first,
          dataStateSuccess.data!.results.first,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'call() should get the status empty',
      () async {
        when(repository.getPersonsList())
            .thenAnswer((_) async => dataStateEmpty);
        final response = await personUseCase();
        verify(repository.getPersonsList()).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataEmpty);
      },
    );

    test(
      'call() should get the status failed',
      () async {
        when(repository.getPersonsList())
            .thenAnswer((_) async => dataStateFailed);
        final response = await personUseCase();
        verify(repository.getPersonsList()).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          dataStateFailed.error,
        );
        assert(response is DataFailed);
      },
    );
  });
}
