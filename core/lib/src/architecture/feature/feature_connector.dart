import 'adapters/injector_adapter.dart';
import 'adapters/router_adapter.dart';

abstract class FeatureConnector {
  RouterAdapter get router;
  InjectorAdapter get injector;
}
