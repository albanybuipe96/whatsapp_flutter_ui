import 'package:components/src/theme/nexus_theme_data.dart';
import 'package:flutter/material.dart';

class NexusTheme extends InheritedWidget {
  const NexusTheme({
    required super.child,
    required this.light,
    required this.dark,
    super.key,
  });

  final NexusThemeData light;
  final NexusThemeData dark;

  static NexusThemeData of(BuildContext context) {
    final result = context.dependOnInheritedWidgetOfExactType<NexusTheme>();
    assert(result != null, 'No NexusTheme found in context');
    final currentBrightness = Theme.of(context).brightness;
    return currentBrightness == Brightness.dark ? result!.dark : result!.light;
  }

  @override
  bool updateShouldNotify(NexusTheme oldWidget) {
    return oldWidget.light != light || oldWidget.dark != dark;
  }
}
