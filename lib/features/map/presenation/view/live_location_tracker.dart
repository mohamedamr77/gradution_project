import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import '../../../../core/service/location_service.dart';

class LiveLocationTrackerScreen extends StatefulWidget {
  const LiveLocationTrackerScreen({super.key});

  @override
  State<LiveLocationTrackerScreen> createState() =>
      _LiveLocationTrackerScreenState();
}

class _LiveLocationTrackerScreenState extends State<LiveLocationTrackerScreen> {
  GoogleMapController? googleMapController;
  late CameraPosition initialCameraPosition;
  bool isFirstCall = true;
  late LocationService locationService;


  @override
  void initState() {
    super.initState();
    initialCameraPosition = const CameraPosition(
        zoom: 1,
        target: LatLng(
          30.71267721100487,
          31.245531572282285,
        ));
    locationService = LocationService();
    updateMyLocation();
  }


  updateMyLocation() async {
    locationService.getRealTimeLocationData(
      onData: (LocationData locationData) {
        setMtLocationPosition(locationData);
      },
    );
  }

  setMtLocationPosition(LocationData locationData) {
    double lat = locationData.latitude!;
    double lon = locationData.longitude!;
    if (isFirstCall) {
      var cameraPosition = CameraPosition(
        zoom: 15,
        target: LatLng(lat, lon),
      );
      googleMapController
          ?.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      isFirstCall = false;
    } else {
      googleMapController
          ?.animateCamera(CameraUpdate.newLatLng(LatLng(lat, lon)));
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    googleMapController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: (controller) async {
        googleMapController = controller;
      },
      initialCameraPosition: initialCameraPosition,
      myLocationEnabled: true,
      mapToolbarEnabled: true,
    );
  }
}

/*
  1- check location service enable or disable
  2- request permission from user
  3- get location from user
  4- display location
 */

/*

 // ToDo : Animation Scaffold ShowSnackBar
  ScaffoldMessenger.of(context).showSnackBar(
                   SnackBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    content: AwesomeSnackbarContent(
                      title: 'Location Service Disabled',
                      titleTextStyle: TextStyle(fontSize: 14),
                      message: 'Please enable location services to proceed.',
                      contentType: ContentType.warning, // You can choose other types like success, warning, etc.
                    ),
                  ),
 */
