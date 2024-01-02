import 'package:challenge/src/data/data_source/local/challenge_data_base.dart';
import 'package:challenge/src/domain/use_case/implementation/person_use_case.dart';
import 'package:challenge/src/domain/use_case/implementation/popular_movie_use_case.dart';
import 'package:challenge/src/domain/use_case/implementation/recommendations_movie_use_case.dart';
import 'package:challenge/src/domain/use_case/implementation/top_rated_movie_use_case.dart';
import 'package:challenge/src/presentation/bloc/movie_bloc.dart';
import 'package:challenge/src/presentation/bloc/person_bloc.dart';
import 'package:http/http.dart';
import 'package:challenge/src/presentation/bloc/image_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'data/data_source/local/images_storage.dart';
import 'data/data_source/local/location_data_base.dart';
import 'data/data_source/remote/api_service.dart';
import 'data/repository/repository.dart';
import 'presentation/bloc/map_bloc.dart';

class Di {
  void injectDependencies() {
    Get.lazyPut(
      () => ChallengeDataBase.instance,
    );
    Get.lazyPut(
      () => Location(),
    );
    Get.lazyPut(
      () => LocationDatabase.instance,
    );
    Get.lazyPut(
      () => MapBloc(),
    );
    Get.lazyPut(
      () => ImagePicker(),
    );
    Get.lazyPut(
      () => ImagesStorage.instance,
    );
    Get.lazyPut(
      () => ImageBloc(),
    );
    Get.lazyPut(
      () => Client(),
    );
    Get.lazyPut(
      () => ApiService(),
    );
    Get.lazyPut(
      () => Repository(),
    );
    Get.lazyPut(
      () => RecommendationsMovieUseCase(),
    );
    Get.lazyPut(
      () => TopRatedMovieUseCase(),
    );
    Get.lazyPut(
      () => PopularMovieUseCase(),
    );
    Get.lazyPut(
      () => PersonUseCase(),
    );
    Get.lazyPut(
      () => MovieBloc(),
    );
    Get.lazyPut(
      () => PersonBloc(),
    );
  }
}
