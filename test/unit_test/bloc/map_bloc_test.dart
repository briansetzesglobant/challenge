import 'package:challenge/src/data/data_source/local/location_data_base.dart';
import 'package:challenge/src/data/model/location_model/location_model.dart';
import 'package:challenge/src/presentation/bloc/map_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'map_bloc_test.mocks.dart';

@GenerateMocks([
  LocationDatabase,
])
void main() {
  late MapBloc mapBloc;
  late LocationDatabase locationDatabase;
  late LocationModel locationModel;

  setUp(() {
    locationDatabase = MockLocationDatabase();
    Get.replace(locationDatabase);
    mapBloc = MapBloc();
    locationModel = LocationModel(
      latitude: 1.0,
      longitude: 1.0,
      date: 1.0,
    );
  });

  group('MapBloc test', () {
    test(
      'insertLocation() should insert the location',
      () async {
        when(locationDatabase.insertLocation(locationModel))
            .thenAnswer((_) async => true);
        when(locationDatabase.getLocations())
            .thenAnswer((_) async => [locationModel]);
        await mapBloc.initialize();
        await mapBloc.insertLocation(locationModel);
        verify(locationDatabase.insertLocation(locationModel)).called(1);
        verify(locationDatabase.getLocations()).called(1);
      },
    );

    test(
      'getLocations() should get the locations',
      () async {
        when(locationDatabase.getLocations())
            .thenAnswer((_) async => [locationModel]);
        await mapBloc.initialize();
        await mapBloc.getLocations();
        verify(locationDatabase.getLocations()).called(1);
      },
    );

    test('dispose() should close all observers', () async {
      await mapBloc.initialize();
      mapBloc.dispose();
    });
  });
}
