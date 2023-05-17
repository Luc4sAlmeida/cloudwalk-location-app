import 'package:core/core.dart';

class ComposedType {
  final Type type;
  final String? tag;

  ComposedType({
    required this.type,
    required this.tag,
  });
}

class SimpleInjector extends _InternalInjector {
  static final SimpleInjector _instance = SimpleInjector._internal();
  SimpleInjector._internal();

  factory SimpleInjector() {
    return _instance;
  }
}

class WeakInjector extends _InternalInjector {}

class _InternalInjector implements Injector {
  final Map<ComposedType, dynamic> map = {};

  @override
  void putFactory<T extends Object>(T Function() caller, {String? tag}) {
    map[ComposedType(type: T, tag: tag)] = caller;
  }

  @override
  T get<T extends Object>({String? tag}) {
    final result = map.entries.firstWhere(
      (element) => element.key.type == T && element.key.tag == tag,
      orElse: () => throw Exception("$T is missing in the map injector."),
    );

    if (result.value is Function) {
      return result.value();
    }

    return result.value;
  }

  @override
  void put<T extends Object>(T value, {String? tag}) {
    map[ComposedType(type: T, tag: tag)] = value;
  }

  @override
  void clear<T extends Object>({String? tag}) {
    map.removeWhere((key, value) => key.type == T && key.tag == tag);
  }
}
