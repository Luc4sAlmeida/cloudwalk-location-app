import 'package:core/core.dart';
import 'package:feature_location/src/src.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocationIPMapper extends Mock implements LocationIPMapper {}

class MockIORemote extends Mock implements IORemote {}

void main() {
  late LocationDatasource locationIPDatasource;
  late MockLocationIPMapper mockMapper;
  late MockIORemote mockClient;

  setUp(() {
    mockMapper = MockLocationIPMapper();
    mockClient = MockIORemote();
    locationIPDatasource = LocationIPDatasource(
      mapper: mockMapper,
      client: mockClient,
    );
    registerFallbackValue(Uri.parse('example'));
  });

  group('LocationIPDatasource', () {
    test('should return PositionEntity when HTTP request is successful',
        () async {
      // Arrange
      final mockResponse = IOResponse(
        body: '{"geo": {"latitude": "37.7749", "longitude": "-122.4194"}}',
        status: 200,
      );

      when(
        () => mockClient.request(any(), method: IOMethod.get),
      ).thenAnswer((_) async => mockResponse);

      when(() => mockMapper.fromMap(any())).thenReturn(
        PositionEntity(lat: 37.7749, lng: -122.4194),
      );

      // Act
      final result = await locationIPDatasource.getCurrentPosition();

      // Assert
      expect(result, isA<PositionEntity>());
      expect(result.lat, 37.7749);
      expect(result.lng, -122.4194);
      verify(() => mockMapper.fromMap(any()));
    });

    test('should throw RemoteException when HTTP request fails', () async {
      // Arrange
      final mockResponse = IOResponse(body: 'Error', status: 400);
      when(() => mockClient.request(any(), method: IOMethod.get)).thenAnswer(
        (_) async => mockResponse,
      );

      // Act
      Future<void> result() async {
        await locationIPDatasource.getCurrentPosition();
      }

      // Assert
      expect(result, throwsA(isA<RemoteException>()));
      verifyNever(() => mockMapper.fromMap(any()));
    });
  });
}
