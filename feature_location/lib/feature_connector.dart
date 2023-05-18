import 'package:core/core.dart';

import 'src/src.dart';

class LocationFeatureConnector implements FeatureConnector {
  @override
  InjectorAdapter get injector => LocationInjector();

  @override
  RouterAdapter get router => LocationRouter();
}
