import 'package:flutter/material.dart';

class telaServico extends StatefulWidget {
  @override
  _telaServicoState createState() => _telaServicoState();
}

class _telaServicoState extends State<telaServico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          title: Text("SERVIÇOS"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset("imagens/detalhe_servico.png"),
                    Text("Nossos serviços")
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                      "ellus tristique imperdiet. ut pharetra felis euismod dictumst neque aenea"
                  ),
                )


              ],
            ),
          ),

        )

    );
  }
}
