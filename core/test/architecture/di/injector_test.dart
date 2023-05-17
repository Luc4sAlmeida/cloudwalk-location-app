import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

class TestClass {}

void main() {
  group('Injector', () {
    late Injector injector;

    setUp(() {
      // Same implementation as SimpleInjector but is not an Singleton
      injector = WeakInjector();
    });

    test('put and get should store and retrieve a value', () {
      final testValue = TestClass();
      injector.put(testValue);

      final retrievedValue = injector.get<TestClass>();

      expect(retrievedValue, equals(testValue));
    });

    test(
        'putFactory and get should store and retrieve a factory-produced value',
        () {
      injector.putFactory<TestClass>(() => TestClass());

      final firstValue = injector.get<TestClass>();
      expect(firstValue, isA<TestClass>());

      final secondValue = injector.get<TestClass>();
      expect(secondValue, isA<TestClass>());

      expect(identical(firstValue, secondValue), isFalse);
    });

    test('clear should remove a stored value', () {
      final testValue = TestClass();
      injector.put<TestClass>(testValue);

      injector.clear<TestClass>();

      expect(() => injector.get<TestClass>(), throwsException);
    });

    test('clear with tag should remove a stored value with a specific tag', () {
      final testValue = TestClass();
      const tag = 'myTag';

      injector.put(testValue, tag: tag);

      injector.clear<TestClass>(tag: tag);

      expect(() => injector.get<TestClass>(), throwsException);
    });
  });
}
