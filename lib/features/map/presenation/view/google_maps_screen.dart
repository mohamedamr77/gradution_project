import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'custom_google_map.dart';

class GoogleMapsScreen extends StatelessWidget {
  static const String id = "GoogleMapsScreenId";
  const GoogleMapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomGoogleMap()
    );
  }
}
