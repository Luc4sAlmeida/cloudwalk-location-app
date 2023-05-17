import 'dart:async';

import 'package:flutter/material.dart';

/*
* This class should be only used with BlocScreenBuilder combinated
* don't used it without it because some methods depends on it to be executed.
*/
abstract class BloC<Event, State> {
  late StreamController<State> _stateController;
  late StreamController<Event> _eventController;
  late StreamSubscription<Event> _eventListener;

  Stream<State> get state => _stateController.stream;
  bool get isListeningEvents => !_eventController.isClosed;

  BloC() {
    _stateController = StreamController<State>.broadcast();
    _eventController = StreamController<Event>.broadcast();
    _eventListener = _eventController.stream.listen(onEvent);

    onInit();
  }

  @protected
  void onInit() {
    //
  }

  @protected
  void onReady() {
    //
  }

  @protected
  void onDispose() {
    _stateController.close();
    _eventController.close();
    _eventListener.cancel();
  }

  @protected
  void onEvent(Event event);

  void dispatchEvent(Event event) {
    _eventController.add(event);
  }

  @protected
  void emit(State state) {
    _stateController.add(state);
  }
}
