import 'package:feature_location/src/src.dart';

abstract class Geotracker {
  Future<PositionEntity> getCurrentPosition();

  Future<bool> isServiceEnabled();
  Future<bool> hasPermission();

  Future<bool> requestPermission();
}
