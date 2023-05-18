import 'package:feature_location/src/src.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final mapper = LocationIPMapper();

  group('LocationIPMapper', () {
    test('should convert from map to PositionEntity', () {
      // Arrange
      final map = {
        'geo': {
          'latitude': '37.7749',
          'longitude': '-122.4194',
        },
      };

      // Act
      final result = mapper.fromMap(map);

      // Assert
      expect(result.lat, 37.7749);
      expect(result.lng, -122.4194);
    });

    test('should convert to map from PositionEntity', () {
      // Arrange
      final entity = PositionEntity(lat: 37.7749, lng: -122.4194);

      // Act
      final result = mapper.toMap(entity);

      // Assert
      expect(result['geo']['latitude'], 37.7749);
      expect(result['geo']['longitude'], -122.4194);
    });
  });
}
