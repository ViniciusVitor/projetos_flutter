import 'package:aprenda_ingles/telas/Animais.dart';
import 'package:aprenda_ingles/telas/Numeros.dart';
import 'package:aprenda_ingles/telas/Vogais.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Aprenda inglês"),
        bottom: TabBar(
          indicatorWeight: 4,
          indicatorColor: Colors.white,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: "Animais",),
            Tab(text: "Números",),
            Tab(text: "Vogais",)
          ],
        ),
      ) ,
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Animmais(),
          Numeros(),
          Vogais()
        ],
      ),
    );
  }
}
