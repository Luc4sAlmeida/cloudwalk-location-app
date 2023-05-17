import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUseCase extends Mock implements UseCase<String, int> {
  @override
  Future<Either<Failure, int>> call({required String params}) async {
    if (params == 'success') {
      return const Right(42);
    }
    return Left(CacheFailure(message: 'cache failure'));
  }
}

void main() {
  group('UseCase', () {
    late MockUseCase useCase;

    setUp(() {
      useCase = MockUseCase();
    });

    test('Call with valid params should return Right with output', () async {
      const params = 'success';
      const expectedOutput = 42;

      final result = await useCase.call(params: params);
      expect(result, isA<Right<Failure, int>>());
      expect(result.fold((l) => l, (r) => r), expectedOutput);
    });

    test('Call with invalid params should return Left with failure', () async {
      const params = 'error';
      final result = await useCase.call(params: params);

      expect(result, isA<Left<Failure, int>>());
      expect(result.fold((l) => l, (r) => r), isA<Failure>());
    });
  });
}
