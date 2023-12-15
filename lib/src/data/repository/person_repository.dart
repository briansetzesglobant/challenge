import 'package:challenge/src/domain/entity/persons_list_entity.dart';
import '../../core/resource/data_state.dart';
import '../data_source/remote/api_service.dart';
import '../../domain/repository/repository_interface.dart';

class PersonRepository extends RepositoryInterface {
  final ApiService apiService = ApiService();

  @override
  Future<DataState<PersonsListEntity>> getPersonsList() async {
    return await apiService.getPersonsList();
  }
}
