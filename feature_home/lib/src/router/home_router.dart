import 'package:core/core.dart';
import 'package:feature_home/src/presentation/ui/ui.dart';

import 'package:flutter/material.dart';
import 'package:navigator/navigator.dart';

class HomeRouter implements RouterAdapter {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) {
    return {
      HomePortals.root: MaterialPageRoute(
        builder: (_) => HomeScreen(),
        settings: settings,
      ),
    };
  }
}
