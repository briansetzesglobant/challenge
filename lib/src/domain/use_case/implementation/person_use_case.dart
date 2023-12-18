import 'package:challenge/src/core/use_case/use_case_interface.dart';
import 'package:challenge/src/data/repository/repository.dart';
import 'package:challenge/src/domain/entity/person/persons_list_entity.dart';
import '../../../core/resource/data_state.dart';

class PersonUseCase extends UseCaseInterface {
  final Repository personRepository = Repository();

  @override
  Future<DataState<PersonsListEntity>> call({
    int? id,
  }) async {
    return await personRepository.getPersonsList();
  }
}
