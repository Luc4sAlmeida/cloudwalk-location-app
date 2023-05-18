import 'package:core/core.dart';

abstract class HomeEvent extends BloCEvent {}

class NavigateToLocationEvent extends HomeEvent {
  @override
  List<Object?> get props => [];
}
