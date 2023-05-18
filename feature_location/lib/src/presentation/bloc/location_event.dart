import 'package:core/core.dart';

abstract class LocationEvent extends BloCEvent {}

class GetCurrentPositionEvent extends LocationEvent {
  @override
  List<Object?> get props => [];
}
