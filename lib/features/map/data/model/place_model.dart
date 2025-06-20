import 'package:google_maps_flutter/google_maps_flutter.dart';

class PlaceModel{
  final int id;
  final LatLng latLng;
  final String name;

  PlaceModel( {required this.latLng,required this.id, required this.name});
}


List<PlaceModel> placeList = [
  PlaceModel(id: 1, name: "Children's Hospital Cairo", latLng: const LatLng(30.044420, 31.235712)), // Example: Cairo
  PlaceModel(id: 2, name: "Pediatric Health Unit Giza", latLng: const LatLng(29.976480, 31.131302)), // Example: Giza
  PlaceModel(id: 3, name: "Alexandria Children's Care", latLng: const LatLng(31.215640, 29.955270)), // Example: Alexandria
  PlaceModel(id: 4, name: "Aswan Health Center", latLng: const LatLng(24.088938, 32.899829)), // Example: Aswan
  PlaceModel(id: 5, name: "Luxor Pediatric Unit", latLng: const LatLng(25.687243, 32.639637)), // Example: Luxor
  PlaceModel(id: 6, name: " Child Health Clinic", latLng: const LatLng(31.036373, 31.380691)), // Example: Mansoura
  PlaceModel(id: 7, name: "Mansoura Child Health Clinic", latLng: const LatLng(30.712178948252564, 31.254107848221988)), // Example: Mansoura
  PlaceModel(id: 9, name: "1 Child Health Clinic", latLng: const LatLng(30.71352207455885, 31.24942109445509)), // Example: Mansoura
  PlaceModel(id: 10, name: "3 Child Health Clinic", latLng: const LatLng(30.707406368593052, 31.236711851682617)), // Example: Mansoura
];
