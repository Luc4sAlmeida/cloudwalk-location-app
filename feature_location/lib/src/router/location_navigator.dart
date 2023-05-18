import 'package:core/core.dart';
import 'package:navigator/navigator.dart';

class LocationNavigatorImpl implements LocationNavigator {
  @override
  Future toRoot({required String someParams}) {
    return NavigatorService().toNamed(LocationPortals.root);
  }
}
