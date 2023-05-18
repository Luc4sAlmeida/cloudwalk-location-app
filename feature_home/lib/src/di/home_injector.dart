import 'package:core/core.dart';
import 'package:feature_home/src/src.dart';

class HomeInjector implements InjectorAdapter {
  @override
  Future<void> registerDependencies({
    required Injector injector,
  }) async {
    // Mappers

    // Datasources

    // Repositories

    // Usecases

    // Bloc
    injector.putFactory(
      () => HomeBloC(),
    );
  }
}
