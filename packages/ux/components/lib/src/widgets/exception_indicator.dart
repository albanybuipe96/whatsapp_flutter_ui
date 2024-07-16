import 'package:flutter/material.dart';

class ExceptionIndicator extends StatelessWidget {
  const ExceptionIndicator({this.error = 'Page not found', super.key});

  final String error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ErrorWidget(
        Exception(
          error,
        ),
      ),
    );
  }
}
