import 'package:core/core.dart';

import 'src/src.dart';

class HomeFeatureConnector implements FeatureConnector {
  @override
  InjectorAdapter get injector => HomeInjector();

  @override
  RouterAdapter get router => HomeRouter();
}
