import 'package:core/core.dart';
import 'package:feature_home/src/presentation/ui/states/home_stable_state.dart';
import 'package:feature_home/src/src.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeBloC bloc = SimpleInjector().get();

  @override
  Widget build(BuildContext context) {
    return BlocScreenBuilder(
      bloc: bloc,
      child: Scaffold(
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder(
      stream: bloc.state,
      builder: ((_, snap) {
        final state = snap.data;
        if (state is HomeStableState) {
          return HomeStableStateView(bloc: bloc, state: state);
        }
        return const SizedBox.shrink();
      }),
    );
  }
}
