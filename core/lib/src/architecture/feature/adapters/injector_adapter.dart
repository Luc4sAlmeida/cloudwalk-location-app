import 'package:core/core.dart';

abstract class InjectorAdapter {
  Future<void> registerDependencies({
    required Injector injector,
  });
}
