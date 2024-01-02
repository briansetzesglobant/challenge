import 'package:challenge/src/data/model/location_model/location_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late LocationModel locationModel;
  late Map<String, dynamic> json;

  setUp(() {
    locationModel = LocationModel(
      latitude: 0.0,
      longitude: 0.0,
      date: 0.0,
    );
    json = {
      'latitude': 0.0,
      'longitude': 0.0,
      'date': 0.0,
    };
  });

  group('LocationModel test', () {
    test(
      'fromJson() should transform the json to location model',
          () async {
        final locationModel = LocationModel.fromJson(
          json,
        );
        expect(locationModel.date, 0.0);
      },
    );

    test(
      'toJson() should transform the location model to json',
          () async {
        final locationModelJson = locationModel.toJson();
        expect(locationModelJson, json);
      },
    );
  });
}
