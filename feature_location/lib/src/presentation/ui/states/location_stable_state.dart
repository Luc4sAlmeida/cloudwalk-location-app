import 'package:feature_location/src/src.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationStableStateView extends StatelessWidget {
  final LocationBloC bloc;
  final LocationStableState state;

  const LocationStableStateView({
    required this.bloc,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(state.currentPosition.lat, state.currentPosition.lng),
        zoom: 14.0,
      ),
      padding: const EdgeInsets.all(16.0),
      markers: {
        Marker(
          markerId: const MarkerId('me'),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(
            state.currentPosition.lat,
            state.currentPosition.lng,
          ),
        )
      },
      myLocationButtonEnabled: false,
    );
  }
}
