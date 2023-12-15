import 'dart:async';
import 'package:challenge/src/domain/entity/persons_list_entity.dart';
import 'package:challenge/src/domain/use_case/implementation/person_use_case.dart';
import '../../core/bloc/bloc_interface.dart';
import '../../core/resource/data_state.dart';
import '../../core/use_case/use_case_interface.dart';

class PersonBloc extends BlocInterface {
  PersonBloc();

  late final UseCaseInterface useCaseInterface = PersonUseCase();

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
    final personsList = await useCaseInterface();
    _personsListStreamController.sink.add(personsList);
  }
}
