import 'package:core/core.dart';
import 'package:feature_location/src/src.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLocationRepository extends Mock implements LocationRepository {}

class FakeFailure extends Fake implements Failure {
  @override
  String get message => 'failure';
}

void main() {
  late GetCurrentPositionUseCase useCase;
  late MockLocationRepository mockRepository;

  setUp(() {
    mockRepository = MockLocationRepository();
    useCase = GetCurrentPositionUseCase(repository: mockRepository);
  });

  group('GetCurrentPositionUseCase', () {
    test('Should return an PositionEntity when called', () async {
      final ret = Right<Failure, PositionEntity>(
        PositionEntity(lat: 10.0, lng: 10.0),
      );

      when(() => mockRepository.getCurrentPosition()).thenAnswer(
        (_) async => ret,
      );

      final result = await useCase(params: NoParams());

      expect(result, ret);
      verify(() => mockRepository.getCurrentPosition());
      verifyNoMoreInteractions(mockRepository);
    });

    test('Should return an Failure when called', () async {
      final ret = Left<Failure, PositionEntity>(
        FakeFailure(),
      );

      when(() => mockRepository.getCurrentPosition()).thenAnswer(
        (_) async => ret,
      );

      final result = await useCase(params: NoParams());

      expect(result, ret);
      verify(() => mockRepository.getCurrentPosition());
      verifyNoMoreInteractions(mockRepository);
    });
  });
}
