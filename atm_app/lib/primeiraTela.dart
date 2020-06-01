import 'package:atm_app/segundaTela.dart';
import 'package:flutter/material.dart';

class primeiraTela extends StatefulWidget {
  @override
  _primeiraTelaState createState() => _primeiraTelaState();
}

class _primeiraTelaState extends State<primeiraTela> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Primeira Tela"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: <Widget>[
            RaisedButton(
              child: Text("Ir para a segunda tela"),
              onPressed: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => segundaTela(valor: "Passando dados entre delas",)
                    )
                );
              },
            )
          ],
        ),
      ) ,

    );
  }
}