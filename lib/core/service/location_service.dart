import 'package:location/location.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class LocationService {
  Location location = Location();
  Future<void> checkAndRequestLocationServices() async {
    var isServiceEnabled = await location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await location.requestService();
      if (!isServiceEnabled) {
        throw LocationServiceException; // Show a custom Snackbar using AwesomeSnackbarContent
      }
    }
  }

  Future<void> checkAndRequestLocationPermission() async {
    var permissionStatus = await location.hasPermission();

    if (permissionStatus == PermissionStatus.deniedForever) {
      // Show a dialog or Snackbar guiding the user to settings
      throw LocationPermissionException();
    }

    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await location.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        throw LocationPermissionException();
      }
    }
  }

  getRealTimeLocationData(
      {required void Function(LocationData)? onData}) async {
    await checkAndRequestLocationServices();
    await checkAndRequestLocationPermission();
    // location.changeSettings(interval: 1000, distanceFilter: 40);
    location.onLocationChanged.listen(onData);
  }

  Future<LocationData> getCurrentLocation() async {
    await checkAndRequestLocationServices();
    await checkAndRequestLocationPermission();
    var locationUser = await location.getLocation();
    return locationUser;
  }

  Future<Uint8List> getImageFromRawData({
    required String image,
    required int width,
    required int height,
  }) async {
    var imageData = await rootBundle.load(image);
    var imageCodec = await ui.instantiateImageCodec(
      imageData.buffer.asUint8List(),
      targetHeight: height,
      targetWidth: width,
    );

    ui.FrameInfo imageFrame = await imageCodec.getNextFrame();
    var imageByteData = await imageFrame.image
        .toByteData(format: ui.ImageByteFormat.png); // Specify PNG format
    return imageByteData!.buffer.asUint8List();
  }
}

class LocationServiceException implements Exception {
  final String message;
  LocationServiceException(
      [this.message =
          "Location services are disabled. Please enable them in your settings."]);
  @override
  String toString() {
    return "LocationServiceException: $message";
  }
}

class LocationPermissionException implements Exception {
  final String message;
  LocationPermissionException(
      [this.message =
          "Location permission is denied. Please grant permission to continue."]);

  @override
  String toString() {
    return "LocationPermissionException: $message";
  }
}
