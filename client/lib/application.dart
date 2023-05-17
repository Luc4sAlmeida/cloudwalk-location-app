import 'package:core/core.dart';
import 'package:flutter/material.dart';

class Application extends StatefulWidget {
  final List<FeatureConnector> connectors;

  const Application({
    required this.connectors,
    super.key,
  });

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  late List<RouterAdapter> routes;
  late List<InjectorAdapter> injectors;

  @override
  void initState() {
    final injectors = widget.connectors.map((e) => e.injector).toList();
    routes = widget.connectors.map((e) => e.router).toList();

    for (final injector in injectors) {
      injector.registerDependencies(injector: SimpleInjector());
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: NavigatorService().key,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF3c43f3)),
      ),
      onGenerateRoute: (settings) => generateRoutes(
        settings: settings,
      ),
    );
  }

  Route<dynamic>? generateRoutes({
    required RouteSettings settings,
  }) {
    final routesMap = <String, MaterialPageRoute>{};
    for (final route in routes) {
      routesMap.addAll(route.getRoutes(settings));
    }
    return routesMap[settings.name];
  }
}
