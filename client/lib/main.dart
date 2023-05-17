import 'package:flutter/material.dart';
import 'application.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(const Application(
    connectors: [],
  ));
}
