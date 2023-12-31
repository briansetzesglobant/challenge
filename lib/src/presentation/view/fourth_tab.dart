import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import '../../core/resource/map_notification_service.dart';
import '../../core/resource/map_timer.dart';
import '../../core/util/strings.dart';
import '../../data/model/location_model/location_model.dart';
import '../bloc/map_bloc.dart';

class FourthTab extends StatefulWidget {
  @override
  _FourthTabState createState() => _FourthTabState();
}

class _FourthTabState extends State<FourthTab> {
  final MapBloc mapBloc = Get.find<MapBloc>();
  Location location = Get.find<Location>();
  late bool serviceEnabled;
  late PermissionStatus permissionGranted;

  @override
  void initState() {
    super.initState();
    _checkService();
    _checkPermission();
    location.enableBackgroundMode(enable: true);
    mapBloc.initialize();
    _getLocations();
    _track();
  }

  void _getLocations() async {
    await mapBloc.getLocations();
  }

  @override
  void dispose() {
    mapBloc.dispose();
    super.dispose();
  }

  void _track() {
    MapTimer.getInstance((_) async {
      final LocationData locationData = await location.getLocation();
      await mapBloc.insertLocation(
        LocationModel(
          latitude: locationData.latitude,
          longitude: locationData.longitude,
          date: locationData.time,
        ),
      );
      showNotification();
    });
  }

  void _checkService() async {
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
  }

  void _checkPermission() async {
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  Widget _getMap(List<LocationModel> locations) {
    return FlutterMap(
      options: MapOptions(
        center: LatLng(
          -37.328755,
          -59.136917,
        ),
        zoom: 15.0,
      ),
      children: [
        TileLayer(
          urlTemplate: Strings.mapOpenStreetMap,
          userAgentPackageName: Strings.mapExample,
        ),
        MarkerLayer(
          markers: locations
              .map(
                (location) => Marker(
                  width: 120.0,
                  height: 100.0,
                  point: LatLng(
                    location.latitude!,
                    location.longitude!,
                  ),
                  builder: (_) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: 5.0,
                        ),
                        child: Text(
                          DateFormat(
                            Strings.mapDateFormat,
                          ).format(
                            DateTime.fromMillisecondsSinceEpoch(
                              location.date!.toInt(),
                            ),
                          ),
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Icon(
                        Icons.pin_drop,
                        size: 50.0,
                        color: Colors.red,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<LocationModel>>(
      stream: mapBloc.locationsStream,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<LocationModel>> snapshot,
      ) {
        if (snapshot.hasData) {
          return _getMap(snapshot.data!);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
