import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

class TestInjectorAdapter extends InjectorAdapter {
  @override
  Future<void> registerDependencies({required Injector injector}) async {
    // Simulate registering dependencies
    injector.put<int>(42);
    injector.put<String>('Hello');
  }
}

void main() {
  group('InjectorAdapter', () {
    late Injector injector;
    late InjectorAdapter adapter;

    setUp(() {
      injector = SimpleInjector();
      adapter = TestInjectorAdapter();
    });

    test('registerDependencies should register dependencies in the injector',
        () async {
      await adapter.registerDependencies(injector: injector);

      final intDependency = injector.get<int>();
      final stringDependency = injector.get<String>();

      expect(intDependency, equals(42));
      expect(stringDependency, equals('Hello'));
    });
  });
}
