import 'dart:async';

import 'package:core/core.dart';
import 'package:feature_location/src/src.dart';

class LocationBloC extends BloC<LocationEvent, LocationState> {
  LocationBloC({
    required this.getCurrentPositionUseCase,
  });

  final GetCurrentPositionUseCase getCurrentPositionUseCase;

  @override
  void onReady() {
    dispatchEvent(GetCurrentPositionEvent());
  }

  @override
  void onEvent(LocationEvent event) {
    if (event is GetCurrentPositionEvent) {
      _handleGetCurrentPosition(event);
    }
  }

  Future<void> _handleGetCurrentPosition(GetCurrentPositionEvent event) async {
    emit(LocationLoadingState());

    final request = await getCurrentPositionUseCase(params: NoParams());
    request.fold(
      (failure) {
        emit(LocationErrorState(message: failure.message));
      },
      (position) {
        emit(LocationStableState(currentPosition: position));
      },
    );
  }
}
