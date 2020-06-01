import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() {

  Firestore.instance
  .collection("usuarios")
  .document("pontuacao")
  .setData({"carlos": "50", "Maria": "60"});

  runApp(MaterialApp());

}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


