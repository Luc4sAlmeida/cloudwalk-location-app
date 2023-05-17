import 'package:core/core.dart';
import 'package:flutter/material.dart';

/*
 * Required class to create any widget with BloC
 * the reason behind all those //ignores is that this functions is of extreme
 * necessity for the execute flow of BloC.
 * But should not be used out of here.
 * */
class BlocScreenBuilder extends StatefulWidget {
  final BloC bloc;
  final Widget child;

  const BlocScreenBuilder({required this.bloc, required this.child, super.key});

  @override
  State<BlocScreenBuilder> createState() => _BlocScreenBuilderState();
}

class _BlocScreenBuilderState extends State<BlocScreenBuilder> {
  @override
  void initState() {
    // ignore: invalid_use_of_protected_member
    WidgetsBinding.instance.addPostFrameCallback((_) => widget.bloc.onReady());
    super.initState();
  }

  @override
  void dispose() {
    // ignore: invalid_use_of_protected_member
    widget.bloc.onDispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
