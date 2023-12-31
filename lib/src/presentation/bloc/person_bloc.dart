import 'dart:async';
import 'package:challenge/src/domain/entity/person/persons_list_entity.dart';
import 'package:challenge/src/domain/use_case/implementation/person_use_case.dart';
import 'package:get/get.dart';
import '../../core/bloc/person_bloc_interface.dart';
import '../../core/resource/data_state.dart';
import '../../core/use_case/use_case_interface.dart';

class PersonBloc extends PersonBlocInterface {
  PersonBloc();

  late final UseCaseInterface useCaseInterface = Get.find<PersonUseCase>();

  late StreamController<DataState<PersonsListEntity>>
      _personsListStreamController;

  @override
  Stream<DataState<PersonsListEntity>> get personsListStream =>
      _personsListStreamController.stream;

  @override
  Future<void> initialize() async {
    _personsListStreamController = StreamController();
  }

  @override
  void dispose() {
    _personsListStreamController.close();
  }

  @override
  void getPersonsList() async {
    final DataState<PersonsListEntity> personsList = await useCaseInterface();
    _personsListStreamController.sink.add(personsList);
  }
}
