import 'package:flutter/material.dart';



class MyCheckbox extends StatefulWidget {
  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {

  bool _estaSelecionado = false;
  bool _estaSelecionadoOutra = false;

  bool _valorSwitch = false;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ("Checkbox"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            Text("Comida Brasileira"),
            CheckboxListTile(
              title: Text( "Comida Brasileira"),
              subtitle: Text( "A melhor comida do mundo!"),
              activeColor: Colors.green,
              secondary: Icon(Icons.playlist_add_check),
              value: _estaSelecionado,
              onChanged: (bool valor){
                setState(() {
                  _estaSelecionado = valor;
                });
              },
            ),
            CheckboxListTile(
              title: Text( "Comida Brasileira 2.0"),
              subtitle: Text( "Melhor do que a outra!"),
              activeColor: Colors.green,
              secondary: Icon(Icons.playlist_add_check),
              value: _estaSelecionadoOutra,
              onChanged: (bool valor){
                setState(() {
                  _estaSelecionadoOutra = valor;
                });
              },
            ),

            RaisedButton(
              child: Text(
                  "Salvar",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
                onPressed: (){
                print("Opção 1"+ _estaSelecionado.toString());
                print("Opção 2"+ _estaSelecionadoOutra.toString());

                }
            ),

            //Entrada Switch
            Padding(
              padding: EdgeInsets.only(top: 10),
            ),
            SwitchListTile(
              title: Text("Receber notificações?"),
                value: _valorSwitch,
                onChanged: (bool valor){
                  setState(() {
                    _valorSwitch = valor;
                  });
                }
            ),

          ],
        ),
      ),
    );
  }
}
