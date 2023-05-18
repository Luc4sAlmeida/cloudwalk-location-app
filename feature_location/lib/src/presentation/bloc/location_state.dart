import 'package:core/core.dart';

import 'package:feature_location/src/src.dart';

abstract class LocationState extends BloCState {}

class LocationStableState extends LocationState {
  LocationStableState({
    required this.currentPosition,
  });

  final PositionEntity currentPosition;

  @override
  List<Object> get props => [currentPosition];
}

class LocationLoadingState extends LocationState {
  @override
  List<Object?> get props => [];
}

class LocationErrorState extends LocationState {
  final String message;

  LocationErrorState({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
