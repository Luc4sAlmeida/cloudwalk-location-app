import 'package:core/core.dart';

import 'package:feature_home/src/src.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mocktail/mocktail.dart';
import 'package:navigator/navigator.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockRoute extends Fake implements Route {}

class MockLocationNavigatorRoute extends Mock implements LocationNavigator {}

void main() {
  late HomeBloC bloc;
  late LocationNavigator mockLocationNavigator;

  setUp(() {
    mockLocationNavigator = MockLocationNavigatorRoute();
    bloc = HomeBloC(
      locationNavigator: mockLocationNavigator,
    );
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

        when(() => mockLocationNavigator.toRoot(someParams: 'example'))
            .thenAnswer((invocation) async => {});

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
