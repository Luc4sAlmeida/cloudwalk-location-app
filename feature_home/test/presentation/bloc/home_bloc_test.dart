import 'package:core/core.dart';

import 'package:feature_home/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockRoute extends Fake implements Route {}

void main() {
  late HomeBloC bloc;

  setUp(() {
    bloc = HomeBloC();
    registerFallbackValue(MockRoute());
  });

  tearDown(() {
    // ignore: invalid_use_of_protected_member
    bloc.onDispose();
  });

  group('HomeBloC', () {
    testWidgets(
      'Should dispatch Stable state when onReady is called',
      (tester) async {
        expectLater(
          bloc.state.asBroadcastStream(),
          emits(isA<HomeStableState>()),
        );

        await tester.pumpWidget(BlocScreenBuilder(
          bloc: bloc,
          child: Container(),
        ));
      },
    );
    testWidgets(
      'Should navigate when NavigateToLocationEvent is dispatched',
      (tester) async {
        final mockObserver = MockNavigatorObserver();

        await tester.pumpWidget(MaterialApp(
          navigatorObservers: [mockObserver],
          onGenerateRoute: (settings) {
            return MaterialPageRoute(builder: (context) => Container());
          },
        ));

        bloc.dispatchEvent(NavigateToLocationEvent());

        verify(() => mockObserver.didPush(any(), any()));
      },
    );
  });
}
