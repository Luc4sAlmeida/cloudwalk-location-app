import 'package:core/core.dart';
import 'package:feature_location/src/src.dart';

import 'package:flutter/material.dart';

import 'states/location_loading_state.dart';
import 'states/location_error_state.dart';
import 'states/location_stable_state.dart';

class LocationScreen extends StatelessWidget {
  LocationScreen({super.key});

  final LocationBloC bloc = SimpleInjector().get();

  @override
  Widget build(BuildContext context) {
    return BlocScreenBuilder(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Minha localização'),
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<LocationState>(
      stream: bloc.state,
      builder: ((_, snap) {
        final state = snap.data;

        if (state is LocationStableState) {
          return LocationStableStateView(bloc: bloc, state: state);
        }

        if (state is LocationErrorState) {
          return LocationErrorStateView(bloc: bloc, state: state);
        }

        if (state is LocationLoadingState) {
          return LocationLoadingStateView(bloc: bloc, state: state);
        }

        return const SizedBox.shrink();
      }),
    );
  }
}
