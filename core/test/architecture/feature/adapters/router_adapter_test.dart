import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class RouterAdapter {
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings);
}

class TestRouterAdapter extends RouterAdapter {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) {
    return {
      '/home': MaterialPageRoute(builder: (context) => Container()),
      '/profile': MaterialPageRoute(builder: (context) => Container()),
    };
  }
}

void main() {
  group('RouterAdapter', () {
    late RouterAdapter adapter;

    setUp(() {
      adapter = TestRouterAdapter();
    });

    test('getRoutes should return the correct routes', () {
      final routes = adapter.getRoutes(const RouteSettings(name: '/'));
      expect(routes['/home'], isA<MaterialPageRoute>());
      expect(routes['/profile'], isA<MaterialPageRoute>());
    });
  });
}
