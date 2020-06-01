import 'package:flutter/material.dart';

class alcoolGasolina extends StatefulWidget {
  @override
  _alcoolGasolinaState createState() => _alcoolGasolinaState();
}

class _alcoolGasolinaState extends State<alcoolGasolina> {
  TextEditingController _controllerAlcool = TextEditingController();
  TextEditingController _controllerGasolina = TextEditingController();
  var _mensagemResultado = "...";


  void _calcular(){
    double precoAlcool = double.tryParse(_controllerAlcool.text);
    double precoGasolina = double.tryParse(_controllerGasolina.text);

    if(precoAlcool == null || precoGasolina == null){
      setState(() {
        _mensagemResultado = "Não foi possível fazer o calculo";
      });
    }else{
      if(precoAlcool / precoGasolina >= 0.7){
        setState(() {
          _mensagemResultado = "É melhor abastecer com gasolina";
        });
      }else{
        setState(() {
          _mensagemResultado = "É melhor abastecer com Álcool";
        });
      }

      _limparCampos();

    }
  }

  void _limparCampos(){
    _controllerGasolina.text = "";
    _controllerAlcool.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina"),
        backgroundColor: Colors.lightBlue,
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 32),
                child: Image.asset("imagens/logo.png"),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                  ),

                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Alcool, ex: 1.59"
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerAlcool,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Preço Gasolina, ex: 3.99"
                ),
                style: TextStyle(
                  fontSize: 22,
                ),
                controller: _controllerGasolina,
              ),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: EdgeInsets.all(15),
                  child: Text(
                    "Calcular",
                    style: TextStyle(
                        fontSize: 20
                    ),

                  ),
                  onPressed: _calcular,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                 _mensagemResultado,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
