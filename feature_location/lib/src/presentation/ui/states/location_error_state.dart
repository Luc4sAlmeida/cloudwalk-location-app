import 'package:feature_location/src/src.dart';
import 'package:flutter/material.dart';

class LocationErrorStateView extends StatelessWidget {
  final LocationBloC bloc;
  final LocationErrorState state;

  const LocationErrorStateView({
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
          Text(state.message),
          const SizedBox(
            height: 8.0,
          ),
          TextButton.icon(
            onPressed: () => bloc.dispatchEvent(GetCurrentPositionEvent()),
            icon: const Icon(Icons.refresh),
            label: const Text('Tentar novamente'),
          )
        ],
      ),
    );
  }
}
