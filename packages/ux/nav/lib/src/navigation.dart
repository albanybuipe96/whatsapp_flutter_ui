import 'package:flutter/material.dart';
import 'package:nav/nav.dart';

class Navigation extends InheritedWidget {
  const Navigation({
    required this.routes,
    required super.child,
    super.key,
  });

  final Routes routes;

  static Routes of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<Navigation>();
    assert(result != null, 'No Navigation found in context');
    return Routes(context);
  }

  @override
  bool updateShouldNotify(Navigation oldWidget) {
    return oldWidget.routes != routes;
  }
}
