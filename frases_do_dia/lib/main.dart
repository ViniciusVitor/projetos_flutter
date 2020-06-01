import 'dart:math';

import 'package:flutter/material.dart';


void main(){
  runApp(MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));

}
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _frases = [
    "Olhe para cima, que é de lá que vem tua força!",
    "Agora é a hora de começar a surpreender aqueles que duvidaram de você!",
    "Você nunca será velho demais para sonhar um novo sonho.",
    "Quando pensar em desistir, lembre-se porque começou."
  ];
  var _fraseGerada = "Clique abaixo para gerar uma frase";

 void _gerarFrases(){
   var numSorteado = Random().nextInt(_frases.length);

   setState(() {
      _fraseGerada = _frases[numSorteado];

   });
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Frases do dia"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          //width: double.infinity,
          /*decoration: BoxDecoration(
              border: Border.all(width: 3, color: Colors.amber)
          ),*/
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset("images/logo.png"),
              Text(
                _fraseGerada,
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    color: Colors.black
                ),
              ),
              RaisedButton(
                child: Text(
                  "Nova Frase",
                  style: TextStyle(
                      fontSize: 25,
                      color:  Colors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                color:  Colors.green,
                onPressed: _gerarFrases,
              ),

            ],
          ),

        ),
      ),
    );
  }
}
