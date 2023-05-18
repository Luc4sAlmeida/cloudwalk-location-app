import 'package:core/core.dart';
import 'package:feature_location/src/src.dart';
import 'package:navigator/navigator.dart';

class LocationInjector implements InjectorAdapter {
  @override
  Future<void> registerDependencies({
    required Injector injector,
  }) async {
    // Core
    injector.put<Geotracker>(GeotrackerImpl());

    // Mappers
    injector.put<LocationIPMapper>(LocationIPMapper());

    // Datasources
    injector.put<LocationDatasource>(
      LocationGPSDatasource(
        geotracker: injector.get(),
      ),
      tag: 'gps',
    );

    injector.put<LocationDatasource>(
      LocationIPDatasource(
        client: injector.get(),
        mapper: injector.get(),
      ),
      tag: 'ip',
    );

    // Repositories
    injector.put<LocationRepository>(
      LocationRepositoryImpl(
        geotracker: injector.get(),
        gps: injector.get(tag: 'gps'),
        ip: injector.get(tag: 'ip'),
      ),
    );

    // Usecases
    injector.put<GetCurrentPositionUseCase>(
      GetCurrentPositionUseCase(repository: injector.get()),
    );

    // Navigator
    injector.put<LocationNavigator>(LocationNavigatorImpl());

    // Bloc
    injector.putFactory(
      () => LocationBloC(getCurrentPositionUseCase: injector.get()),
    );
  }
}
