import 'package:core/core.dart';
import 'package:navigator/navigator.dart';

class HomeNavigatorImpl implements HomeNavigator {
  @override
  Future toRoot({required String someParams}) {
    return NavigatorService().toNamed(HomePortals.root);
  }
}
