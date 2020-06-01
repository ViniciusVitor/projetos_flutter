import 'package:flutter/material.dart';


class telaContato extends StatefulWidget {
  @override
  _telaContatoState createState() => _telaContatoState();
}

class _telaContatoState extends State<telaContato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("CONTATO"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(

                  children: <Widget>[
                    Image.asset("imagens/detalhe_contato.png"),
                    Text("Contato da empresa")
                  ],
                ),
                Padding(

                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                      "Nosso email: atm@atm.com.br"
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
