import 'package:core/core.dart';
import 'package:feature_location/src/src.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocationDatasource extends Mock implements LocationDatasource {}

class MockGeotracker extends Mock implements Geotracker {}

void main() {
  late LocationRepositoryImpl locationRepository;
  late LocationDatasource mockGps;
  late LocationDatasource mockIp;
  late Geotracker mockGeotracker;

  setUp(() {
    mockGps = MockLocationDatasource();
    mockIp = MockLocationDatasource();
    mockGeotracker = MockGeotracker();
    locationRepository = LocationRepositoryImpl(
      geotracker: mockGeotracker,
      gps: mockGps,
      ip: mockIp,
    );
  });

  final testEntity = PositionEntity(lat: 10.0, lng: 10.0);

  group('getCurrentPosition', () {
    test(
        'should return GPS position when location service and permission is granted is enabled',
        () async {
      // Arrange
      when(() => mockGeotracker.isServiceEnabled())
          .thenAnswer((_) async => true);

      when(() => mockGeotracker.requestPermission())
          .thenAnswer((_) async => true);

      when(() => mockGps.getCurrentPosition()).thenAnswer(
        (_) async => testEntity,
      );

      // Act
      final result = await locationRepository.getCurrentPosition();

      // Assert
      expect(result.fold((l) => l, (r) => r), testEntity);
      verifyNever(() => mockIp.getCurrentPosition());
    });

    test('should return IP position when location service is disabled',
        () async {
      // Arrange
      when(() => mockGeotracker.isServiceEnabled())
          .thenAnswer((_) async => false);

      when(() => mockIp.getCurrentPosition()).thenAnswer(
        (_) async => testEntity,
      );

      // Act
      final result = await locationRepository.getCurrentPosition();

      // Assert
      expect(result.fold((l) => l, (r) => r), testEntity);
      verifyNever(() => mockGps.getCurrentPosition());
    });

    test('should return IP position when location permission is fully denied',
        () async {
      // Arrange
      when(() => mockGeotracker.isServiceEnabled())
          .thenAnswer((_) async => true);

      when(() => mockGeotracker.requestPermission())
          .thenAnswer((_) async => false);

      when(() => mockIp.getCurrentPosition()).thenAnswer(
        (_) async => testEntity,
      );

      // Act
      final result = await locationRepository.getCurrentPosition();

      // Assert
      expect(result.fold((l) => l, (r) => r), testEntity);
      verifyNever(() => mockGps.getCurrentPosition());
    });

    test('should return RemoteFailure when RemoteException is thrown',
        () async {
      // Arrange
      when(() => mockGeotracker.isServiceEnabled())
          .thenAnswer((_) async => false);

      when(() => mockIp.getCurrentPosition()).thenThrow(
        RemoteException(message: 'Remote exception occurred'),
      );

      // Act
      final result = await locationRepository.getCurrentPosition();

      // Assert
      expect(result.fold((l) => l, (r) => r), isA<RemoteFailure>());
    });

    test('should return CacheFailure when CacheException is thrown', () async {
      // Arrange
      when(() => mockGeotracker.isServiceEnabled())
          .thenAnswer((_) async => true);

      when(() => mockGeotracker.requestPermission())
          .thenAnswer((_) async => true);

      when(() => mockGps.getCurrentPosition()).thenThrow(
        CacheException(message: 'Remote exception occurred'),
      );

      // Act
      final result = await locationRepository.getCurrentPosition();

      // Assert
      expect(result.fold((l) => l, (r) => r), isA<CacheFailure>());
    });
  });
}
