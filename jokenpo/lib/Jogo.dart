import 'dart:math';

import 'package:flutter/material.dart';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _textResultado = "Escolha uma opção abaixo";


  void _opcaoSelecionada(String escolha){

    var _opcoes = ["pedra", "papel", "tesoura"];
    var _numero = Random().nextInt(_opcoes.length);

    var _escolhaApp = _opcoes[_numero];

    print("A escola do usuário foi: "+escolha);
    print("A escolha do App foi: "+_escolhaApp);


    switch (_escolhaApp) {
      case "pedra":
        setState(() {
          _imagemApp = AssetImage("imagens/pedra.png");
        });
        break;
      case "papel":
        setState(() {
          _imagemApp = AssetImage("imagens/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          _imagemApp = AssetImage("imagens/tesoura.png");
        });
        break;

    }
    if((escolha == "pedra" && _escolhaApp == "tesoura")||
        (escolha == "tesoura" && _escolhaApp == "papel")||
        (escolha == "papel" && _escolhaApp == "pedra")){
      setState(() {
        this._textResultado = "Parabéns, você venceu o computador!";

      });
    }else if((_escolhaApp == "pedra" && escolha == "tesoura")||
        (_escolhaApp == "tesoura" && escolha == "papel")||
        (_escolhaApp == "papel" && escolha == "pedra")){
      setState(() {
        this._textResultado = "Você perdeu para o computador!";

      });

    }else{
      setState(() {
        this._textResultado = "EMPATE, tente novamente.";

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Jokenpo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          //text
          //imagem
          //text resultado
          //Linha 3 imagem
          
          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              "Escolha do App",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),

          Image(image: this._imagemApp,),


          Padding(
            padding: EdgeInsets.only(top: 32, bottom: 16),
            child: Text(
              _textResultado,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 95,)
              ),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset("imagens/papel.png", height: 95,)
              ),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("tesoura"),
                  child: Image.asset("imagens/tesoura.png", height: 95,)
              )
              /*
              Image.asset("imagens/pedra.png", height: 95,),
              Image.asset("imagens/papel.png", height: 95,),
              Image.asset("imagens/tesoura.png", height: 95,)*/
            ],
          ),

        ],
      ),
    );
  }
}
