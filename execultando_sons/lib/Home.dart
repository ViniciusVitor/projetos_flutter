import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  AudioPlayer _audioPlayer = AudioPlayer();

  _executar() async{

    String url = "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";
    int resultado = await _audioPlayer.play(url);

    if(resultado == 1){
      print("Som executado com sucesso!");
    }else{
      print("Não foi possivel executar o audio!");
    }

  }
  @override
  Widget build(BuildContext context) {

    _executar();
    return Container();
  }
}
