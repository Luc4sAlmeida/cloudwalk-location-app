import 'package:core/core.dart';
import 'package:feature_home/feature_home.dart';
import 'package:feature_location/feature_connector.dart';
import 'package:flutter/material.dart';

import 'application.dart';
import 'application_injector.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initial injector
  await ApplicationInjector().registerDependencies(
    injector: SimpleInjector(),
  );

  return runApp(Application(
    connectors: [
      HomeFeatureConnector(),
      LocationFeatureConnector(),
    ],
  ));
}
