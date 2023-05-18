import 'package:core/core.dart';

import 'di/di.dart';

class ApplicationInjector implements InjectorAdapter {
  @override
  Future<void> registerDependencies({required Injector injector}) async {
    injector.put<IORemote>(IORemoteImpl());
  }
}
