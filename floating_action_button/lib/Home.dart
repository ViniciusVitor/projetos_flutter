import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FloatingActionButton"),
      ),
      body: Text("Conteudo"),

      floatingActionButtonLocation:
      FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(

        child: Icon(Icons.add),
        onPressed: (){
          print("Resultado: botão precionado");
        },
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.menu),
            )
          ],
        ),
      ),
    );
  }
}
