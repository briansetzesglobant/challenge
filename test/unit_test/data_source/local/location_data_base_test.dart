import 'package:challenge/src/data/data_source/local/location_data_base.dart';
import 'package:challenge/src/data/model/location_model/location_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LocationDatabase locationDatabase;
  late LocationModel locationModel;

  setUp(() async {
    locationDatabase = LocationDatabase.instance;
    locationModel = LocationModel(
      latitude: 0.0,
      longitude: 0.0,
      date: 0.0,
    );
  });

  test(
    'insertLocation() should insert the location and getLocations() should get the locations',
    () async {
      TestWidgetsFlutterBinding.ensureInitialized();
      Firebase.initializeApp().then((value) async {
        await locationDatabase.insertLocation(locationModel);
        final locations = await locationDatabase.getLocations();
        expect(locations.first.date, 0.0);
      });
    },
  );
}
