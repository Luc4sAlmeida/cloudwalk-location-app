import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class MockRoute extends Fake implements Route {}

void main() {
  late NavigatorService navigator;

  setUp(() {
    navigator = NavigatorService();
    registerFallbackValue(MockRoute());
  });

  group('Navigator', () {
    testWidgets(
      'Should navigate push route when toNamed is called',
      (tester) async {
        final mockObserver = MockNavigatorObserver();

        final home = Scaffold(
          body: FilledButton(
            onPressed: () => navigator.toNamed('/settings'),
            child: const Text('Navigate'),
          ),
        );

        await tester.pumpWidget(MaterialApp(
          navigatorObservers: [mockObserver],
          onGenerateRoute: (settings) {
            if (settings.name == '/settings') {
              return MaterialPageRoute(
                builder: (context) => const SizedBox(),
              );
            }

            return MaterialPageRoute(builder: (context) => home);
          },
        ));

        await tester.tap(find.byType(FilledButton));
        await tester.pumpAndSettle();

        verify(() => mockObserver.didPush(any(), any()));
      },
    );
  });
}
