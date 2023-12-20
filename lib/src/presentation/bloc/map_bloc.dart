import 'dart:async';
import '../../core/bloc/bloc.dart';
import '../../data/data_source/local/location_data_base.dart';
import '../../data/model/location_model/location_model.dart';

class MapBloc extends Bloc {
  final LocationDatabase locationDatabase = LocationDatabase.instance;

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

  void insertLocation(LocationModel location) async {
    locationDatabase.insertLocation(location);
    if (!_locationsStreamController.isClosed) {
      getLocations();
    }
  }

  void getLocations() async {
    final locations = await locationDatabase.getLocations();
    _locationsStreamController.sink.add(locations);
  }
}
