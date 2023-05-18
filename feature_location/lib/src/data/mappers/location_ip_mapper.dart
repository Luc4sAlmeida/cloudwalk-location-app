import 'package:feature_location/src/src.dart';

class LocationIPMapper implements LocationMapper {
  @override
  PositionEntity fromMap(Map<String, dynamic> map) {
    return PositionEntity(
      lat: double.parse(map['geo']['latitude']),
      lng: double.parse(map['geo']['longitude']),
    );
  }

  @override
  Map<String, dynamic> toMap(PositionEntity entity) {
    return {
      'geo': {
        'latitude': entity.lat,
        'longitude': entity.lng,
      }
    };
  }
}
