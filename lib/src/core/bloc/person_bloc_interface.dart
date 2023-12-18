import '../../domain/entity/person/persons_list_entity.dart';
import '../resource/data_state.dart';
import 'bloc.dart';

abstract class PersonBlocInterface extends Bloc {
  Stream<DataState<PersonsListEntity>> get personsListStream;

  void getPersonsList();
}
