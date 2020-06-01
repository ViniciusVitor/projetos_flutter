import 'package:flutter/material.dart';

void showMessage({
  @required GlobalKey<ScaffoldState> key,
  @required String message,
}) {
  key.currentState.showSnackBar(
    SnackBar(
      content: Text(message, style: TextStyle(color: Colors.white)),
      duration: Duration(seconds: 3),
    ),
  );
}
