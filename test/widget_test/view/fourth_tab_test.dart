import 'dart:async';
import 'package:challenge/src/data/model/location_model/location_model.dart';
import 'package:challenge/src/presentation/bloc/map_bloc.dart';
import 'package:challenge/src/presentation/view/fourth_tab.dart';
import 'package:challenge/src/presentation/widget/widget_empty.dart';
import 'package:challenge/src/presentation/widget/widget_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'fourth_tab_test.mocks.dart';

@GenerateMocks([
  MapBloc,
  Location,
])
void main() {
  late MapBloc mapBloc;
  late List<LocationModel> list;
  late LocationModel locationModel;
  late Location location;

  setUp(() {
    mapBloc = MockMapBloc();
    Get.replace(mapBloc);
    locationModel = LocationModel(
      latitude: 1.0,
      longitude: 1.0,
      date: 1.0,
    );
    list = [
      locationModel,
    ];
    location = MockLocation();
    Get.replace(location);
  });

  testWidgets('FourthTab() should display the map page',
      (WidgetTester tester) async {
    when(mapBloc.initialize()).thenAnswer((_) async => true);
    when(mapBloc.getLocations()).thenAnswer((_) async => true);
    when(mapBloc.insertLocation(locationModel)).thenAnswer((_) async => true);
    when(mapBloc.locationsStream).thenAnswer((_) => Stream.value(list));
    when(location.enableBackgroundMode(enable: true))
        .thenAnswer((_) async => true);
    when(location.serviceEnabled()).thenAnswer((_) async => true);
    when(location.requestService()).thenAnswer((_) async => true);
    when(location.hasPermission())
        .thenAnswer((_) async => PermissionStatus.granted);
    when(location.requestPermission())
        .thenAnswer((_) async => PermissionStatus.granted);
    await tester.runAsync(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: FourthTab(),
        ),
      );
    });
    await tester.pump();
    expect(find.byType(FlutterMap), findsOneWidget);
    expect(find.byType(WidgetEmpty), findsNothing);
    expect(find.byType(WidgetError), findsNothing);
  });
}
