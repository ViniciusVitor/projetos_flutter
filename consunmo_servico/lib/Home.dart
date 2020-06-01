import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _resultado = "...";

  TextEditingController _controllerCEP = TextEditingController();

  void _recuperarCep() async {

    String url = "https://viacep.com.br/ws/${_controllerCEP.text}/json/";
    http.Response response;

    response = await http.get(url);

    print ("Resultado: "+response.statusCode.toString());
    print("Body: "+response.body);

    Map<String, dynamic> retorno =  json.decode(response.body);
    String cep = retorno ["cep"];
    String logradouro = retorno ["logradouro"];
    String bairro = retorno ["bairro"];
    String localidade = retorno ["localidade"];
    String uf = retorno ["uf"];

    print(
      "Resposta CEP: ${cep} lagradouro: ${logradouro} bairro ${bairro} localidade ${localidade} Estado ${uf}"
    );

    setState(() {
      _resultado = "${cep}, ${logradouro}, ${bairro}, ${localidade}, ${uf}";
    });

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço"),
      ),
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Digite o CEP",
              ),
              style: TextStyle(
                fontSize: 20
              ),
              controller: _controllerCEP,
            ),
            RaisedButton(
              child: Text("Clique aqui"),
              onPressed: _recuperarCep,

            ),
            Text(_resultado)
          ],
        ),
      ),
    );
  }
}
