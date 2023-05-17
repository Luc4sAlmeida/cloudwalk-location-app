import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

// Events
abstract class Event {}

class IncrementEvent implements Event {}

// States
abstract class State {}

class EmptyState implements State {}

class StableState implements State {}

class MockBloC extends BloC<Event, State> {
  bool onInitOk = false;
  bool onReadyOk = false;

  @override
  void onInit() {
    onInitOk = true;
    super.onInit();
  }

  @override
  void onReady() {
    onReadyOk = true;
    super.onReady();
  }

  @override
  void onEvent(Event event) {
    if (event is IncrementEvent) {
      emit(StableState());
    }
  }

  void dispose() {
    super.onDispose();
  }
}

void main() {
  group('Bloc', () {
    late MockBloC bloc;

    setUp(() {
      bloc = MockBloC();
    });

    test('onInit should be executed', () {
      expect(bloc.onInitOk, isTrue);
    });

    test('onDispose should close the stream controllers', () {
      bloc.dispose();
      expect(bloc.state, emitsDone);
      expect(bloc.isListeningEvents, isFalse);
    });

    testWidgets("onReady should be called when the BlocScreenBuilder is built",
        (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(BlocScreenBuilder(
        bloc: bloc,
        child: const SizedBox.shrink(),
      ));

      expect(bloc.onReadyOk, isTrue);
    });

    test('Increment event should emit StableState', () {
      bloc.dispatchEvent(IncrementEvent());
      expectLater(bloc.state, emits(isA<StableState>()));
    });
  });
}
