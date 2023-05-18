import 'package:feature_location/src/src.dart';
import 'package:flutter/material.dart';

class LocationLoadingStateView extends StatelessWidget {
  final LocationBloC bloc;
  final LocationLoadingState state;

  const LocationLoadingStateView({
    required this.bloc,
    required this.state,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}
