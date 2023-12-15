import 'package:challenge/src/core/use_case/use_case_interface.dart';
import 'package:challenge/src/data/repository/person_repository.dart';
import 'package:challenge/src/domain/entity/persons_list_entity.dart';
import '../../../core/resource/data_state.dart';

class PersonUseCase extends UseCaseInterface {
  final PersonRepository personRepository = PersonRepository();

  @override
  Future<DataState<PersonsListEntity>> call() async {
    return await personRepository.getPersonsList();
  }
}
