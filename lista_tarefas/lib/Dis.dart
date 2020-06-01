import 'package:flutter/material.dart';

class Dis extends StatefulWidget {
  @override
  _DisState createState() => _DisState();
}

class _DisState extends State<Dis> {

  List _lista = ["João", "Tiago", "Maria"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dismissible"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: ListView.builder(
                itemCount: _lista.length,
                  itemBuilder: (context, index){
                  final item = _lista[index];
                  return Dismissible(
                    background: Container(
                      color: Colors.red,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.delete,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.green,
                      padding: EdgeInsets.all(16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Icon(
                            Icons.edit,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                    //direction: DismissDirection.up,
                      onDismissed: (direction){
                        print("direção: "+direction.toString());
                      },
                      key: Key (item),


                      child: ListTile(
                        title: Text(item),
                      )
                  );
                  }
              )
          )
        ],
      ),
    );
  }
}
