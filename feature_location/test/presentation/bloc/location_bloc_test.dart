import 'package:core/core.dart';
import 'package:feature_location/src/src.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCurrentPositionUseCase extends Mock
    implements GetCurrentPositionUseCase {}

class FakeFailure extends Fake implements Failure {
  @override
  String get message => 'failure';
}

void main() {
  group('LocationBloC', () {
    late LocationBloC bloc;
    late MockGetCurrentPositionUseCase mockGetCurrentPositionUseCase;

    setUp(() {
      mockGetCurrentPositionUseCase = MockGetCurrentPositionUseCase();
      bloc = LocationBloC(
        getCurrentPositionUseCase: mockGetCurrentPositionUseCase,
      );
      registerFallbackValue(NoParams());
    });

    tearDown(() {
      // ignore: invalid_use_of_protected_member
      bloc.onDispose();
    });

    test('onReady should dispatch GetCurrentPositionEvent', () async {
      final currentPosition = PositionEntity(lat: 10.0, lng: 20.0);

      when(() => mockGetCurrentPositionUseCase(params: any(named: 'params')))
          .thenAnswer(
        (_) async => Right(currentPosition),
      );

      expectLater(
        bloc.state.asBroadcastStream(),
        emitsInOrder(
          [
            LocationLoadingState(),
            LocationStableState(currentPosition: currentPosition),
          ],
        ),
      );

      bloc.onReady();
    });

    test(
        'GetCurrentPositionEvent should emit LocationLoadingState and LocationStableState on successful request',
        () async {
      final currentPosition = PositionEntity(lat: 10.0, lng: 20.0);
      when(() => mockGetCurrentPositionUseCase(params: any(named: 'params')))
          .thenAnswer(
        (_) async => Right(currentPosition),
      );

      expectLater(
        bloc.state.asBroadcastStream(),
        emitsInOrder(
          [
            LocationLoadingState(),
            LocationStableState(currentPosition: currentPosition),
          ],
        ),
      );

      bloc.dispatchEvent(GetCurrentPositionEvent());
    });

    test(
        'GetCurrentPositionEvent should emit LocationLoadingState and LocationErrorState on failed request',
        () async {
      when(() => mockGetCurrentPositionUseCase(params: any(named: 'params')))
          .thenAnswer(
        (_) async => Left(FakeFailure()),
      );

      expectLater(
        bloc.state.asBroadcastStream(),
        emitsInOrder(
          [
            LocationLoadingState(),
            LocationErrorState(message: 'failure'),
          ],
        ),
      );

      bloc.dispatchEvent(GetCurrentPositionEvent());
    });
  });
}
