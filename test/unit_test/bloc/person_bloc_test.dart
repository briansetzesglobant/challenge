import 'package:challenge/src/core/resource/data_state.dart';
import 'package:challenge/src/domain/entity/person/persons_list_entity.dart';
import 'package:challenge/src/domain/use_case/implementation/person_use_case.dart';
import 'package:challenge/src/presentation/bloc/person_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'person_bloc_test.mocks.dart';

@GenerateMocks([
  PersonUseCase,
])
void main() {
  late PersonBloc personBloc;
  late PersonUseCase personUseCase;
  late DataState<PersonsListEntity> dataStateSuccess;
  late DataState<PersonsListEntity> dataStateEmpty;
  late DataState<PersonsListEntity> dataStateFailed;
  late PersonsListEntity personsListEntity;

  setUp(() {
    personBloc = PersonBloc();
    personUseCase = MockPersonUseCase();
    Get.replace(personUseCase);
    personsListEntity =
        PersonsListEntity(page: 1, results: [], totalPages: 1, totalResults: 1);
    dataStateSuccess = DataSuccess(
      personsListEntity,
    );
    dataStateEmpty = const DataEmpty();
    dataStateFailed = const DataFailed(
      'error',
    );
  });

  group('PersonBloc test', () {
    test(
      'getPersonsList() should get the status success',
      () async {
        when(personUseCase()).thenAnswer((_) async => dataStateSuccess);
        await personBloc.initialize();
        personBloc.getPersonsList();
        verify(personUseCase()).called(1);
      },
    );

    test(
      'getPersonsList() should get the status empty',
      () async {
        when(personUseCase()).thenAnswer((_) async => dataStateEmpty);
        await personBloc.initialize();
        personBloc.getPersonsList();
        verify(personUseCase()).called(1);
      },
    );

    test(
      'getPersonsList() should get the status failed',
      () async {
        when(personUseCase()).thenAnswer((_) async => dataStateFailed);
        await personBloc.initialize();
        personBloc.getPersonsList();
        verify(personUseCase()).called(1);
      },
    );

    test('dispose() should close all observers', () async {
      await personBloc.initialize();
      personBloc.dispose();
    });
  });
}
