import 'package:feature_location/src/core/geotracker/entities/position_entity.dart';
import 'package:geolocator/geolocator.dart';

import '../interface/geotracker.dart';

extension LocationPermissionExt on LocationPermission {
  bool get isDenied =>
      this == LocationPermission.denied ||
      this == LocationPermission.deniedForever ||
      this == LocationPermission.unableToDetermine;
  bool get isGranted => !isDenied;
}

class GeotrackerImpl implements Geotracker {
  @override
  Future<PositionEntity> getCurrentPosition() async {
    if (!(await hasPermission()) || !(await isServiceEnabled())) {
      throw Exception();
    }

    final pos = await Geolocator.getCurrentPosition();
    return PositionEntity(lat: pos.latitude, lng: pos.longitude);
  }

  @override
  Future<bool> hasPermission() async {
    return (await Geolocator.checkPermission()).isGranted;
  }

  @override
  Future<bool> isServiceEnabled() async {
    return (await Geolocator.isLocationServiceEnabled());
  }

  @override
  Future<bool> requestPermission() async {
    return (await Geolocator.requestPermission()).isGranted;
  }
}
