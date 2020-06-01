import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _tabController = TabController(length: 3, vsync: this);

  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Abas"),
        bottom: TabBar(
          controller: _tabController,
            tabs: <Widget>[
              Tab(
                text: "Home",
                icon: Icon(Icons.home)
              ),
              Tab(
                  text: "Email",
                  icon: Icon(Icons.email)
              ),
              Tab(
                  text: "Conta",
                  icon: Icon(Icons.account_circle)
              ),
            ],
        ),

      ),
      body: TabBarView(
        controller: _tabController,
          children: <Widget>[
            Text("Primeira pagina"),
            Text("Segunda pagina"),
            Text("Terceira pagina")
          ],
      ),
    );
  }
}
