import 'package:feature_home/feature_home.dart';
import 'package:flutter/material.dart';
import 'application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(Application(
    connectors: [
      HomeFeatureConnector(),
    ],
  ));
}
