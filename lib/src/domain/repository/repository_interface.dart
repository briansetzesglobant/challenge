import 'package:challenge/src/domain/entity/persons_list_entity.dart';
import '../../core/resource/data_state.dart';

abstract class RepositoryInterface {
  Future<DataState<PersonsListEntity>> getPersonsList();
}
