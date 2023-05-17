import 'package:flutter/material.dart';

class NavigatorService {
  static final NavigatorService _instance = NavigatorService._internal();
  NavigatorService._internal();

  factory NavigatorService() {
    return _instance;
  }

  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  Future<R?> toNamed<R>(String routeName, {Object? args}) async {
    return key.currentState?.pushNamed<R>(routeName, arguments: args);
  }
}
