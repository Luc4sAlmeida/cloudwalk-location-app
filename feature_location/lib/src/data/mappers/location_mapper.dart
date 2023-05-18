import 'package:feature_location/src/src.dart';

abstract class LocationMapper {
  PositionEntity fromMap(Map<String, dynamic> map);
  Map<String, dynamic> toMap(PositionEntity entity);
}
