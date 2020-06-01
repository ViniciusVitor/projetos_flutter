
import 'package:flutter/material.dart';
import 'package:http/http.dart' as  http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _preco = "0";

  void _recuperarPreco() async{
    String _url = "https://blockchain.info/ticker";

    print(_url);
    print("Estamos aqui");

    http.Response response;

    response = await http.get(_url);

    print(response.body);

    Map<String, dynamic> retorno = json.decode(response.body);


    print(retorno["BRL"]["buy"]);

    setState(() {
      _preco = retorno["BRL"]["buy"].toString();
    });



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(

        padding: EdgeInsets.all(32),

        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset("imagens/bitcoin.png"),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                  "R\$" + _preco,
                  style: TextStyle(
                    fontSize: 35
                  ),
                ),
              ),
              RaisedButton(
                child: Text(
                  "Atualizar",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
                color: Colors.orange,
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                onPressed: _recuperarPreco,
              )


            ],
          ),
        ),
      ),
    );
  }
}