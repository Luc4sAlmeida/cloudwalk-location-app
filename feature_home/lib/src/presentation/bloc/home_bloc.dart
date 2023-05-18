import 'package:core/core.dart';
import 'package:navigator/navigator.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloC extends BloC<HomeEvent, HomeState> {
  final LocationNavigator locationNavigator;

  HomeBloC({
    required this.locationNavigator,
  });

  @override
  void onReady() {
    emit(HomeStableState());
  }

  @override
  void onEvent(HomeEvent event) {
    if (event is NavigateToLocationEvent) {
      locationNavigator.toRoot(someParams: 'example');
    }
  }
}
