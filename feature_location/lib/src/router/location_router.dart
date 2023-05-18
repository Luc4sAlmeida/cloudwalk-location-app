import 'package:core/core.dart';
import 'package:feature_location/src/presentation/ui/ui.dart';

import 'package:flutter/material.dart';
import 'package:navigator/navigator.dart';

class LocationRouter implements RouterAdapter {
  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) {
    return {
      LocationPortals.root: MaterialPageRoute(
        builder: (_) => LocationScreen(),
        settings: settings,
      ),
    };
  }
}
