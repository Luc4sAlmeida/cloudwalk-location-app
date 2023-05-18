class LocationPortals {
  static const String root = '/location';
}

abstract class LocationNavigator {
  Future toRoot({
    required String someParams,
  });
}
