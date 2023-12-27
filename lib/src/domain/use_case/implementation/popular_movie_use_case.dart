import 'package:challenge/src/core/use_case/use_case_interface.dart';
import 'package:challenge/src/data/repository/repository.dart';
import 'package:challenge/src/domain/entity/movie/movies_list_entity.dart';
import 'package:get/get.dart';
import '../../../core/resource/data_state.dart';

class PopularMovieUseCase extends UseCaseInterface {
  final Repository repository = Get.find<Repository>();

  @override
  Future<DataState<MoviesListEntity>> call({
    int? id,
  }) async {
    return await repository.getPopularMoviesList();
  }
}
