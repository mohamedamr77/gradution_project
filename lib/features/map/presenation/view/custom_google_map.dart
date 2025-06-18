import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import '../../../../core/service/location_service.dart';
import '../../data/model/place_model.dart';

class CustomGoogleMap extends StatefulWidget {
  const CustomGoogleMap({super.key});

  @override
  State<CustomGoogleMap> createState() => _CustomGoogleMapState();
}

class _CustomGoogleMapState extends State<CustomGoogleMap> {
  late CameraPosition initialCameraPosition;
  late LocationService locationService;
  GoogleMapController? googleMapController;
  Set<Marker> markers = {};
  Set<Polyline> polylines = {};
  Set<Polygon> polygons = {};
  Set<Circle> circles = {};
  bool isFirstCall = true;

  @override
  void initState() {
    super.initState();
    initialCameraPosition = const CameraPosition(
        zoom: 15,
        target: LatLng(
          0,
          0,
        ));
    locationService = LocationService();
    updateMyLocation();
    initMarkers();
    // initPointLine();
    // initPolygons();
    // initCircles();
  }

  @override
  @override
  void dispose() {
    googleMapController?.dispose();
    super.dispose();
  }

  void initMapStyle() async {
    var nightMapStyle = await DefaultAssetBundle.of(context)
        .loadString("assets/map_style/night_map_style_.json");
    googleMapController!.setMapStyle(nightMapStyle);
  }

  void initMarkers() async {
    var customMarkerIcon = BitmapDescriptor.fromBytes(
        await locationService.getImageFromRawData(
            image: "assets/images/lcoationMarker.png",
            width: 120,
            height: 120));
    Set<Marker> myMarkers = placeList
        .map((placesMarkersModel) => Marker(
        icon: customMarkerIcon,
        infoWindow: InfoWindow(
          title: placesMarkersModel.name,
        ),
        position: placesMarkersModel.latLng,
        markerId: MarkerId(placesMarkersModel.id.toString())))
        .toSet();
    markers.addAll(myMarkers);
    setState(() {});
  }

  void initPointLine() {
    Polyline polyline1 = const Polyline(
      geodesic: true,
      zIndex: 2,
      width: 6,
      startCap: Cap.roundCap,
      color: Colors.red,
      polylineId: PolylineId("1"),
      points: [
        LatLng(30.712178948252564, 31.254107848221988),
        LatLng(30.71352207455885, 31.24942109445509),
        LatLng(30.711085796365335, 31.250000904338716),
        LatLng(30.705668434056193, 31.249603886217514),
        LatLng(30.044420, 31.235712),
      ],
    );
    Polyline polyline2 = const Polyline(
      patterns: [PatternItem.dot],
      zIndex: 1,
      width: 6,
      startCap: Cap.roundCap,
      color: Colors.black,
      polylineId: PolylineId("2"),
      points: [
        LatLng(30.709643661359767, 31.24715445905162),
        LatLng(30.70501120306149, 31.25620208871418),
        LatLng(30.71423219789815, 31.267384552342055),
        LatLng(30.718689424356732, 31.2537622784681),
      ],
    );

    polylines.add(polyline1);
    polylines.add(polyline2);
    setState(() {});
  }

  void initPolygons() {
    Polygon polygon = Polygon(
        fillColor: Colors.red.withOpacity(0.4),
        strokeColor: Colors.red.withOpacity(0.4),
        strokeWidth: 5,
        polygonId: const PolygonId("1"),
        points: const [
          LatLng(30.713413670001152, 31.249665050638015),
          LatLng(30.711119359112534, 31.24726001524078),
          LatLng(30.712464794955565, 31.24472319708206),
          LatLng(30.710694480736663, 31.239929599132786),
        ]);
    polygons.add(polygon);
  }

  void initCircles() {
    Circle circle = Circle(
      circleId: const CircleId("1"),
      fillColor: Colors.green.withOpacity(0.2),
      radius: 500,
      center: const LatLng(30.713413670001152, 31.249665050638015),
    );

    circles.add(circle);
    setState(() {}); // Ensure the UI updates with the new circle
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
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          circles: circles,
          polygons: polygons,
          polylines: polylines,
          zoomControlsEnabled: true,
          initialCameraPosition: initialCameraPosition,
          mapType: MapType.terrain,
          markers: markers,
          onMapCreated: (controller) {
            googleMapController = controller;
            initMapStyle();
          },
          myLocationEnabled: true,
          mapToolbarEnabled: true,
        ),
        Positioned(
          bottom: 40,
          right: 40,
          left: 40,
          child: ElevatedButton(
              onPressed: () {
                CameraPosition cameraPosition = const CameraPosition(
                    zoom: 18,
                    target: LatLng(30.710469441426305, 31.240245013503866));
                googleMapController!.animateCamera(
                    CameraUpdate.newCameraPosition(cameraPosition));
                setState(() {});
              },
              child: const Text("Change Location")),
        )
      ],
    );
  }
}

/*
 world view => 0 -> 3
 country view => 4 -> 6
 city view => 10 -> 12
 street view => 13 -> 17
 building view => 18 -> 20
 */

/*
 * This file is part of the google_maps_flutter package.
  style webSite :
  https://mapstyle.withgoogle.com/
  https://stylist.atlist.com/

 */

// cameraTargetBounds: CameraTargetBounds(
//
//   // southWest : جنوب غرب
//    // northEast : شمال شرق
//   LatLngBounds(southwest:
//       const LatLng(30.707935026016738, 31.232818133521103)
//       , northeast: const LatLng(30.710370699215414, 31.24016844773085))
// ),

/*
       first way to make multi markers
    Set<Marker> myMarkers = {};
    for (int i = 0; i < placeList.length; i++) {
      myMarkers.add(Marker(
          markerId: MarkerId("${placeList[i].id}"),
          position: placeList[i].latLng));
    }
    markers.addAll(myMarkers);
    */
