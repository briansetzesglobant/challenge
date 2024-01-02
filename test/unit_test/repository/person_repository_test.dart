import 'package:challenge/src/core/resource/data_state.dart';
import 'package:challenge/src/data/data_source/local/challenge_data_base.dart';
import 'package:challenge/src/data/data_source/remote/api_service.dart';
import 'package:challenge/src/data/repository/repository.dart';
import 'package:challenge/src/domain/entity/person/person_entity.dart';
import 'package:challenge/src/domain/entity/person/persons_list_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'person_repository_test.mocks.dart';

@GenerateMocks([
  ApiService,
  ChallengeDataBase,
])
void main() {
  late Repository repository;
  late ApiService apiService;
  late ChallengeDataBase challengeDataBase;
  late DataState<PersonsListEntity> dataStateSuccess;
  late DataState<PersonsListEntity> dataStateEmpty;
  late DataState<PersonsListEntity> dataStateFailed;
  late PersonsListEntity personsListEntity;
  late PersonEntity personEntity;

  setUp(() {
    apiService = MockApiService();
    Get.replace(apiService);
    challengeDataBase = MockChallengeDataBase();
    Get.replace(challengeDataBase);
    repository = Repository();
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
    personsListEntity = PersonsListEntity(
      page: 1,
      results: [
        personEntity,
      ],
      totalPages: 20,
      totalResults: 1,
    );
    dataStateSuccess = DataSuccess(
      personsListEntity,
    );
    dataStateEmpty = const DataEmpty();
    dataStateFailed = const DataFailed(
      'error',
    );
  });

  group('Repository test', () {
    test(
      'getPersonsList() should get the status success when service state is success and database data is not empty',
      () async {
        when(apiService.getPersonsList())
            .thenAnswer((_) async => dataStateSuccess);
        when(challengeDataBase.deleteAllPersonEntity())
            .thenAnswer((_) async => true);
        when(challengeDataBase.insertPersonEntity(personEntity))
            .thenAnswer((_) async => true);
        when(challengeDataBase.selectAllPersonEntity())
            .thenAnswer((_) async => [personEntity]);
        final response = await repository.getPersonsList();
        verify(apiService.getPersonsList()).called(1);
        verify(challengeDataBase.deleteAllPersonEntity()).called(1);
        verify(challengeDataBase.insertPersonEntity(personEntity)).called(1);
        verify(challengeDataBase.selectAllPersonEntity()).called(1);
        expect(
          response.data,
          dataStateSuccess.data,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'getPersonsList() should get the status success when service state is empty and database data is not empty',
      () async {
        when(apiService.getPersonsList())
            .thenAnswer((_) async => dataStateEmpty);
        when(challengeDataBase.selectAllPersonEntity())
            .thenAnswer((_) async => [personEntity]);
        final response = await repository.getPersonsList();
        verify(apiService.getPersonsList()).called(1);
        verify(challengeDataBase.selectAllPersonEntity()).called(1);
        expect(
          response.data,
          dataStateSuccess.data,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'getPersonsList() should get the status success when service state is failed and database data is not empty',
      () async {
        when(apiService.getPersonsList())
            .thenAnswer((_) async => dataStateFailed);
        when(challengeDataBase.selectAllPersonEntity())
            .thenAnswer((_) async => [personEntity]);
        final response = await repository.getPersonsList();
        verify(apiService.getPersonsList()).called(1);
        verify(challengeDataBase.selectAllPersonEntity()).called(1);
        expect(
          response.data,
          dataStateSuccess.data,
        );
        expect(
          response.error,
          null,
        );
        assert(response is DataSuccess);
      },
    );

    test(
      'getPersonsList() should get the status empty when service state is empty and database data is empty',
      () async {
        when(apiService.getPersonsList())
            .thenAnswer((_) async => dataStateEmpty);
        when(challengeDataBase.selectAllPersonEntity())
            .thenAnswer((_) async => []);
        final response = await repository.getPersonsList();
        verify(apiService.getPersonsList()).called(1);
        verify(challengeDataBase.selectAllPersonEntity()).called(1);
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
      'getPersonsList() should get the status empty when service state is failed and database data is empty',
      () async {
        when(apiService.getPersonsList())
            .thenAnswer((_) async => dataStateFailed);
        when(challengeDataBase.selectAllPersonEntity())
            .thenAnswer((_) async => []);
        final response = await repository.getPersonsList();
        verify(apiService.getPersonsList()).called(1);
        verify(challengeDataBase.selectAllPersonEntity()).called(1);
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
      'getPersonsList() should get the status failed when service state is success and database fail',
      () async {
        Exception exception = Exception();
        when(apiService.getPersonsList())
            .thenAnswer((_) async => dataStateSuccess);
        when(challengeDataBase.deleteAllPersonEntity())
            .thenAnswer((_) async => true);
        when(challengeDataBase.insertPersonEntity(personEntity))
            .thenAnswer((_) async => true);
        when(challengeDataBase.selectAllPersonEntity()).thenThrow(exception);
        final response = await repository.getPersonsList();
        verify(apiService.getPersonsList()).called(1);
        verify(challengeDataBase.deleteAllPersonEntity()).called(1);
        verify(challengeDataBase.insertPersonEntity(personEntity)).called(1);
        verify(challengeDataBase.selectAllPersonEntity()).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          'An error has occurred while loading persons: ${exception.toString()}',
        );
        assert(response is DataFailed);
      },
    );

    test(
      'getPersonsList() should get the status failed when service state is empty and database fail',
      () async {
        Exception exception = Exception();
        when(apiService.getPersonsList())
            .thenAnswer((_) async => dataStateEmpty);
        when(challengeDataBase.selectAllPersonEntity()).thenThrow(exception);
        final response = await repository.getPersonsList();
        verify(apiService.getPersonsList()).called(1);
        verify(challengeDataBase.selectAllPersonEntity()).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          'An error has occurred while loading persons: ${exception.toString()}',
        );
        assert(response is DataFailed);
      },
    );

    test(
      'getPersonsList() should get the status failed when service state is failed and database fail',
      () async {
        Exception exception = Exception();
        when(apiService.getPersonsList())
            .thenAnswer((_) async => dataStateFailed);
        when(challengeDataBase.selectAllPersonEntity()).thenThrow(exception);
        final response = await repository.getPersonsList();
        verify(apiService.getPersonsList()).called(1);
        verify(challengeDataBase.selectAllPersonEntity()).called(1);
        expect(
          response.data,
          null,
        );
        expect(
          response.error,
          'An error has occurred while loading persons: ${exception.toString()}',
        );
        assert(response is DataFailed);
      },
    );
  });
}
