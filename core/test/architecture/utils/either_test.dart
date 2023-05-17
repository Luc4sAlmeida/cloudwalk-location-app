import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Either', () {
    test('Left should invoke the ifLeft callback', () {
      const value = 'left value';
      const either = Left<String, int>(value);

      final result = either.fold((l) => l, (r) => r);

      expect(result, equals(value));
    });

    test('Right should invoke the ifRight callback', () {
      const value = 42;
      const either = Right<String, int>(value);

      final result = either.fold((l) => l, (r) => r);

      expect(result, equals(value));
    });
  });
}
