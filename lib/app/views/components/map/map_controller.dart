import 'dart:async';

import 'package:connect/core/values/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_hoc081098/flutter_google_places_hoc081098.dart';
import 'package:get/get.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:location/location.dart' as locationUser;

extension LocationDataToLatLng on locationUser.LocationData {
  LatLng toLatLng() {
    return LatLng(latitude ?? 0, longitude ?? 0);
  }
}

class UserLocation {
  final LatLng? location;
  final String? desc;
  UserLocation({this.location, this.desc});
}

class MapController extends GetxController {
  MapController();

  locationUser.LocationData? currentLocation;
  UserLocation? selectedLocation;

  // Ho chi minh city -  Diamond
  final initialLocation = const LatLng(10.780869643816898, 106.69846030352691);
  final location = locationUser.Location();
  Set<Marker> makers = {};
  var searchLocation = "Choosing activity location";
  final Completer<GoogleMapController> mapController = Completer();
  CameraPosition? cameraPosition;

  @override
  void onInit() async {
    await initLocation();
    super.onInit();
  }

  Future<void> initLocation() async {
    final statusPermission = await location.hasPermission();
    if (statusPermission != locationUser.PermissionStatus.granted ||
        statusPermission != locationUser.PermissionStatus.grantedLimited) {
      currentLocation = await location.getLocation();
      update();
    } else {
      //  request permission here

    }
  }

  Future<void> search(BuildContext context) async {
    var place = await PlacesAutocomplete.show(
        context: context,
        apiKey: googleApiKey,
        mode: Mode.overlay,
        onError: (err) {
          // ignore: avoid_print
          print(err);
        });

    if (place != null) {
      // searchLocation = place.description.toString();

      final plist = GoogleMapsPlaces(
        apiKey: googleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders(),
      );

      String placeId = place.placeId ?? "0";
      final detail = await plist.getDetailsByPlaceId(placeId);
      final geometry = detail.result.geometry!;

      //move map camera to selected place with animation
      final controller = await mapController.future;
      controller.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(geometry.location.lat, geometry.location.lng),
              zoom: 17),
        ),
      );

      selectedLocation = UserLocation(
        location: LatLng(geometry.location.lat, geometry.location.lng),
        desc: place.description.toString(),
      );

      //  add maker
      makers.add(
        Marker(
          markerId: MarkerId(DateTime.now().millisecond.toString()),
          position: LatLng(geometry.location.lat, geometry.location.lng),
          infoWindow: InfoWindow(title: "Create Activity", onTap: () {}),
        ),
      );

      update();
    } else {}
  }
}
