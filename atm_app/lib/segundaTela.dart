import 'package:flutter/material.dart';

class segundaTela extends StatefulWidget {
  String valor;

  segundaTela({this.valor});
  @override
  _segundaTelaState createState() => _segundaTelaState();
}

class _segundaTelaState extends State<segundaTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Tela"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
           Text("Segunda tela com o nome: ${widget.valor}")

          ],
        ),
      ) ,

    );
  }
}
