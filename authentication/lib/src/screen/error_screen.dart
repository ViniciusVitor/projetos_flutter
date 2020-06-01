import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final String error;

  ErrorScreen({@required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
