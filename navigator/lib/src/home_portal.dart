class HomePortals {
  static const String root = '/';
}

abstract class HomeNavigator {
  Future toRoot({
    required String someParams,
  });
}
