import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';

class IncrementEvent extends BloCEvent {
  @override
  List<Object?> get props => [];
}

class EmptyState extends BloCState {
  @override
  List<Object?> get props => [];
}

class StableState extends BloCState {
  @override
  List<Object?> get props => [];
}

class MockBloC extends BloC {
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
  void onEvent(BloCEvent event) {
    if (event is IncrementEvent) {
      emit(StableState());
    }
  }

  void dispose() {
    super.onDispose();
  }
}

void main() {
  late MockBloC bloc;

  setUp(() {
    bloc = MockBloC();
  });

  group('Bloc', () {
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
