import 'package:flutter/material.dart';

abstract class RouterAdapter {
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings);
}
