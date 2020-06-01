import 'package:flutter/material.dart';
import 'package:youtube_app/CustomSearchDelegate.dart';
import 'package:youtube_app/telas/Biblioteca.dart';
import 'package:youtube_app/telas/EmAlta.dart';
import 'package:youtube_app/telas/Inicio.dart';
import 'package:youtube_app/telas/Inscricao.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indeiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    List<Widget> _paginas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];


    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.grey,
          opacity: 1
        ),
        backgroundColor: Colors.white,
        title: Image.asset(
            "imagens/youtube.png",
          height: 200,
          width: 100,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.videocam),
            onPressed: (){
              print("ação: videocam");
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              print("ação: pesquisa");
              String res = await showSearch(context: context, delegate: CustomSearchDelegate());
              print("O usuário quer fazer uma pesquisa sobre: "+res);
              setState(() {
                _resultado = res;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("ação: conta");
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: _paginas[_indeiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indeiceAtual,
        onTap: (indice){
          setState(() {
            _indeiceAtual = indice;
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.orange,
            title: Text("Início"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.blue,
              title: Text("Em alta"),
              icon: Icon(Icons.whatshot)
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.green,
              title: Text("Inscrições"),
              icon: Icon(Icons.subscriptions)
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.yellow,
              title: Text("Biblioteca"),
              icon: Icon(Icons.folder)
          ),
        ],
      ),
    );
  }
}
