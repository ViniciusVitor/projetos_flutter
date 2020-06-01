import 'package:flutter/material.dart';

class telaCliente extends StatefulWidget {
  @override
  _telaClienteState createState() => _telaClienteState();
}

class _telaClienteState extends State<telaCliente> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          title: Text("CLIENTE"),
          backgroundColor: Colors.green,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset("imagens/detalhe_cliente.png"),
                    Text("Nossos clientes")
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text(
                      "Lorem ipsum primis vel nullam platea conubia donec, laoreet euismod rutrum enim magna gravida vitae arcu, laoreet fermentum hac phasellus tristique imperdiet. ut pharetra felis euismod dictumst neque aenean mattis praesent, a sociosqu purus tristique arcu viverra sem iaculis, in dui cras eget accumsan tellus pulvinar. sagittis donec id fermentum tempor vehicula eleifend vehicula, pulvinar fermentum quam bibendum vel per et massa, fusce scelerisque aliquet pharetra ultricies placerat. fames etiam malesuada inceptos suspendisse odio gravida amet mi, odio pulvinar suspendisse eu nisi etiam est pulvinar auctor, magna tellus vitae etiam ullamcorper tristique malesuada. "

                  ),
                )


              ],
            ),
          ),

        )

    );
  }
}
