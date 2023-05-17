abstract class Injector {
  void putFactory<T extends Object>(T Function() caller, {String? tag});
  void put<T extends Object>(T value, {String? tag});
  T get<T extends Object>({String? tag});
  void clear<T extends Object>({String? tag});
}
