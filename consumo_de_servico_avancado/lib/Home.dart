import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'Post.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _urlBase = "https://jsonplaceholder.typicode.com";


  Future<List<Post>>_recuperarPostagens() async{
    http.Response response = await http.get(_urlBase + "/posts");
    var dadosJson = json.decode(response.body);

    List<Post> postagens = List();

    for(var post in dadosJson){
      Post p = Post(post["useId"], post["id"], post["title"], post["body"]);
      postagens.add(p);
    }

    print(postagens.toString());
    return postagens;

  }

  _Post() async{

    var corpo = json.encode(
        {
          "userId": 200,
          "id": null,
          "title": "Meu titulo",
          "body": "Corpo da postagem"
        }
    );


    http.Response response = await http.post(
        _urlBase + "/posts",
      headers: {
        "Content-type": "application/json; charset=UTF-8"
      }, body: corpo

    );

    print("SALVAR");
    print ("Verificação "+ response.statusCode.toString());
    print("Corpo da postagem "+ response.body);


  }


  _Put() async {

    var corpo = json.encode(
        {
          "userId": 120,
          "id": null,
          "title": "Meu titulo alterado",
          "body": "Corpo da postagem alterada"
        }
    );


    http.Response response = await http.put(
        _urlBase + "/posts/2",
        headers: {
          "Content-type": "application/json; charset=UTF-8"
        }, body: corpo

    );
    print("EDITAR");

    print ("Verificação "+ response.statusCode.toString());
    print("Corpo da postagem "+ response.body);

  }


  _Patch(){


  }

  _delete() async{
    http.Response response = await http.delete(_urlBase + "/posts/2");
    print("DELETAR");
    print ("Verificação "+ response.statusCode.toString());
    print("Corpo da postagem "+ response.body);
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consumo de serviço avançado"),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                RaisedButton(
                  child: Text("Salvar"),
                  onPressed: _Post,
                ),
                RaisedButton(
                  child: Text("Editar"),
                  onPressed: _Put,
                ),
                RaisedButton(
                  child: Text("Excluir"),
                  onPressed: _delete,
                ),
              ],
            ),


            Expanded(
              child: FutureBuilder<List<Post>>(
                future: _recuperarPostagens(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none :
                    case ConnectionState.waiting :
                      print("conexao waiting");
                      return Center(
                        child: CircularProgressIndicator(),
                      );


                      break;
                    case ConnectionState.active :
                    case ConnectionState.done :
                      print("conexao done");
                      if (snapshot.hasError) {
                        print("Erro ao tentar carregar lista");
                      } else {
                        print("Lista carreagada com sucesso!");

                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (context, index) {
                              List<Post> lista = snapshot.data;
                              Post post = lista[index];

                              return ListTile(
                                title: Text(post.title),
                                subtitle: Text(post.id.toString()),
                              );
                            }
                        );
                      }
                      break;
                  }

                  return Center(
                    child: Text( "" ),
                  );

                },

              ),
            )


          ],
        ),
      ),
    );
  }
}
