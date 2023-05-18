import 'package:core/core.dart';
import 'package:feature_home/src/src.dart';
import 'package:navigator/navigator.dart';

class HomeInjector implements InjectorAdapter {
  @override
  Future<void> registerDependencies({
    required Injector injector,
  }) async {
    // Mappers

    // Datasources

    // Repositories

    // Usecases

    //Navigator
    injector.put<HomeNavigator>(HomeNavigatorImpl());

    // Bloc
    injector.putFactory(
      () => HomeBloC(),
    );
  }
}
