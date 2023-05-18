import 'package:feature_home/src/src.dart';
import 'package:flutter/material.dart';

class HomeStableStateView extends StatelessWidget {
  final HomeBloC bloc;
  final HomeStableState state;

  const HomeStableStateView({
    required this.bloc,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/logo.png'),
          FilledButton(
            onPressed: () => bloc.dispatchEvent(NavigateToLocationEvent()),
            child: const Text('Abrir localização'),
          ),
        ],
      ),
    );
  }
}
