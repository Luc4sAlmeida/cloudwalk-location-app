import 'package:core/core.dart';
import 'package:flutter/material.dart';

/*
 * Classe requerida para criar qualquer Widget utilizando BloC 
 * O motivo de // ignore nas funções abaixo é por conta de extrema necessidade
 * de chamar os métodos para sua inicialização independente mas não devem ser 
 * utilizar fora da própria classe.
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
