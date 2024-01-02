import 'dart:async';
import 'package:get/get.dart';

import '../../core/bloc/bloc.dart';
import '../../data/data_source/local/location_data_base.dart';
import '../../data/model/location_model/location_model.dart';

class MapBloc extends Bloc {
  final LocationDatabase locationDatabase = Get.find<LocationDatabase>();

  late StreamController<List<LocationModel>> _locationsStreamController;

  Stream<List<LocationModel>> get locationsStream =>
      _locationsStreamController.stream;

  @override
  Future<void> initialize() async {
    _locationsStreamController = StreamController();
  }

  @override
  void dispose() {
    _locationsStreamController.close();
  }

  Future<void> insertLocation(LocationModel location) async {
    await locationDatabase.insertLocation(location);
    if (!_locationsStreamController.isClosed) {
      await getLocations();
    }
  }

  Future<void> getLocations() async {
    final locations = await locationDatabase.getLocations();
    _locationsStreamController.sink.add(locations);
  }
}
