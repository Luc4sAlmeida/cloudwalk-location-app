import 'package:core/core.dart';
import 'package:feature_location/src/src.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGeotracker extends Mock implements Geotracker {}

void main() {
  late LocationDatasource locationGPSDatasource;
  late Geotracker mockGeotracker;

  setUp(() {
    mockGeotracker = MockGeotracker();
    locationGPSDatasource = LocationGPSDatasource(geotracker: mockGeotracker);
  });

  group(
    'LocationGPSDatasource',
    () {
      test(
        'should return PositionEntity when device has permission and location service',
        () async {
          // Arrange
          when(() => mockGeotracker.isServiceEnabled())
              .thenAnswer((_) async => true);

          when(() => mockGeotracker.hasPermission()).thenAnswer(
            (_) async => true,
          );

          when(() => mockGeotracker.getCurrentPosition()).thenAnswer(
            (_) async => PositionEntity(lat: 10.0, lng: 10.0),
          );

          // Act
          final result = await locationGPSDatasource.getCurrentPosition();

          // Assert
          expect(result, isA<PositionEntity>());
        },
      );

      test(
          'should throws CacheException when device has permission or location is denied',
          () async {
        // Arrange
        when(() => mockGeotracker.getCurrentPosition()).thenThrow(
          Exception(),
        );

        // Act
        Future<void> result() async {
          await locationGPSDatasource.getCurrentPosition();
        }

        // Assert
        expect(result, throwsA(isA<CacheException>()));
      });
    },
  );
}
