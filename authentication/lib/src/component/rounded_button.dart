import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  RoundedButton({
    @required this.text,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 50,
          child: RaisedButton(
            child: Text(
              text,
              style: TextStyle(fontSize: 24),
            ),
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
